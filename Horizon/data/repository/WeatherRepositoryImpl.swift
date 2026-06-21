//
//  WeatherRepositoryImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
import Foundation
class WeatherRepositoryImpl: WeatherRepository {

    private let remoteDataSource: WeatherRemoteDataSource

    init(remoteDataSource: WeatherRemoteDataSource = WeatherRemoteDatasourceImpl()) {
        self.remoteDataSource = remoteDataSource
    }

    func getCurrentWeather(query: String) async throws -> CurrentWeather {
        let dto = try await remoteDataSource.getCurrentWeather(query: query)
        return dto.toEntity()
    }

    func getDailyForecast(query: String, days: Int) async throws -> [DailyForecast] {
        let dtoArray = try await remoteDataSource.getDailyForecast(query: query, days: days)
        return dtoArray.map { $0.toEntity() }
    }

    func getHourlyForecast(query: String) async throws -> [HourlyForecast] {
        let dtoArray = try await remoteDataSource.getHourlyForecast(query: query)
        return dtoArray.map { $0.toEntity() }
    }

    func getWeatherStats(query: String) async throws -> CurrentWeather {
        let dto = try await remoteDataSource.getWeatherStats(query: query)
        return dto.toEntity()
    }

    func getLocation(query: String) async throws -> Location {
        let dto = try await remoteDataSource.getLocation(query: query)
        return dto.toEntity()
    }
}
