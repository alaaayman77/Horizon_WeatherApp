//
//  SearchViewModel.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published private(set) var countries: [Country] = []
    @Published private(set) var filteredCountries: [Country] = []
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?

    var isSearching: Bool { !query.trimmingCharacters(in: .whitespaces).isEmpty }
    var displayedCountries: [Country] { isSearching ? filteredCountries : countries }

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
                let trimmed = value.trimmingCharacters(in: .whitespaces)
                if trimmed.isEmpty {
                    self.filteredCountries = []
                } else {
                    self.filteredCountries = self.countries.filter {
                        $0.name.localizedCaseInsensitiveContains(trimmed)
                    }
                }
            }
            .store(in: &cancellables)
    }

    func loadCountries() async {
        guard countries.isEmpty else { return }
        isLoading = true
        errorMessage = nil
        do {
            countries = try await getCountries.execute()
        } catch {
            errorMessage = "Couldn't load countries. Try again."
        }
        isLoading = false
    }

    func clearQuery() {
        query = ""
        filteredCountries = []
    }


}
