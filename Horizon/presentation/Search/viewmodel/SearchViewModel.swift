//
//  SearchViewModel.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//


import Foundation
import Combine
import SwiftData

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?
    @Published private(set) var displayedCountries: [CountryItem] = []

    var isSearching: Bool { !query.trimmingCharacters(in: .whitespaces).isEmpty }

    private var allNetworkCountries: [Country] = []
    private let getCountries: GetCountriesUsecase
    private var cancellables = Set<AnyCancellable>()

    init(getCountries: GetCountriesUsecase = GetCountriesUsecase()) {
        self.getCountries = getCountries
        setupSearch()
    }

    private func setupSearch() {
        $query
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] value in
                guard let self else { return }
                self.updateDisplayedCountries(for: value)
            }
            .store(in: &cancellables)
    }

    func loadCountries(context: ModelContext) async {
        guard allNetworkCountries.isEmpty else { return }
        isLoading = true
        errorMessage = nil
        do {
            allNetworkCountries = try await getCountries.execute()
            updateDisplayedCountries(for: query)
            syncFavorites(context: context)
        } catch {
            errorMessage = "Couldn't load countries. Try again."
        }
        isLoading = false
    }

    func clearQuery() {
        query = ""
    }

    private func updateDisplayedCountries(for searchQuery: String) {
        let trimmed = searchQuery.trimmingCharacters(in: .whitespaces)

        let filtered: [Country]
        if trimmed.isEmpty {
            filtered = allNetworkCountries
        } else {
            filtered = allNetworkCountries.filter {
                $0.name.localizedCaseInsensitiveContains(trimmed)
            }
        }

        let existingFavorites = Dictionary(
            uniqueKeysWithValues: displayedCountries.map { ($0.query, $0.isFavorite) }
        )

        self.displayedCountries = filtered.map { domainCountry in
            CountryItem(
                name: domainCountry.name,
                code: domainCountry.code,
                flagEmoji: domainCountry.flagEmoji,
                query: domainCountry.query,
                isFavorite: existingFavorites[domainCountry.query] ?? false
            )
        }
    }

    func toggleFavorite(for country: CountryItem, context: ModelContext) {
        let dao = FavoritesDAOImpl(context: context)
        let localDS = FavouriteLocalDatasourceImpl(dao: dao)
        let repo = FavouriteRepositoryImpl(localDataSource: localDS)
        let saveFavorite = SaveFavouriteUsecase(repository: repo)
        let deleteFavorite = DeleteFavouriteUsecase(repository: repo)

        do {
            if country.isFavorite {
                try deleteFavorite.execute(query: country.query)
            } else {
                let newFav = FavoriteLocation(
                    query: country.query,
                    name: country.name,
                    code: country.code,
                    flagEmoji: country.flagEmoji,
                    createdAt: Date()
                )
                try saveFavorite.execute(location: newFav)

                Task {
                    await cacheWeather(for: country.query, context: context)
                }
            }

            if let idx = displayedCountries.firstIndex(where: { $0.query == country.query }) {
                displayedCountries[idx].isFavorite.toggle()
            }
            syncFavorites(context: context)

        } catch {
            errorMessage = "Failed to update favorite status."
        }
    }

    func syncFavorites(context: ModelContext) {
        let dao = FavoritesDAOImpl(context: context)
        let localDS = FavouriteLocalDatasourceImpl(dao: dao)
        let repo = FavouriteRepositoryImpl(localDataSource: localDS)
        let checkFavorite = CheckFavouriteUsecase(repository: repo)

        for i in 0..<displayedCountries.count {
            let isFav = (try? checkFavorite.execute(query: displayedCountries[i].query)) ?? false
            displayedCountries[i].isFavorite = isFav
        }
    }

    private func cacheWeather(for query: String, context: ModelContext) async {
        let weatherRepo = WeatherRepositoryImpl()
        let getCurrentWeather = GetCurrentWeatherUsecase(repository: weatherRepo)
        let getDailyForecast = GetDailyForecastUsecase(repository: weatherRepo)
        let getLocation = GetLocationUsecase(repository: weatherRepo)

        let cacheDAO = WeatherCacheDAOImpl(context: context)
        let cacheLocalDS = WeatherCacheLocalDatasourceImpl(dao: cacheDAO)
        let cacheRepo = WeatherCacheRepositoryImpl(localDataSource: cacheLocalDS)
        let saveCache = SaveWeatherCacheUsecase(repository: cacheRepo)

        do {
            let current          = try await getCurrentWeather.execute(query: query)
            let daily            = try await getDailyForecast.execute(query: query, days: 3)
            let resolvedLocation = try await getLocation.execute(query: query)
            try saveCache.execute(
                query: query,
                current: current,
                daily: daily,
                location: resolvedLocation
            )
        } catch {
  
        }
    }
}
