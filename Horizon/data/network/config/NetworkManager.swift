//
//  NetworkManager.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
import Foundation
import Alamofire

protocol NetworkService {
    func fetchData<T: Decodable>(url: String, parameters: [String: Any]) async throws -> T
}

class NetworkManager: NetworkService {
    func fetchData<T: Decodable>(url: String, parameters: [String: Any]) async throws -> T {
        let request = AF.request(url, method: .get, parameters: parameters)
        let dataResponse = await request.serializingDecodable(T.self).response
        return try dataResponse.result.get()
    }
}
