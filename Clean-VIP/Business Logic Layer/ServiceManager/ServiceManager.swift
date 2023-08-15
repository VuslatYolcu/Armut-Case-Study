//
//  ServiceManager.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 16.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

/// Primary API service object to get data
final class ServiceManager {
    /// Shared singleton instance
    static let shared = ServiceManager()
    
    private let cacheManager = CacheManager()
    
    /// Privatized constructer
    private init() { }
    
    enum ServiceError: String, CodingKey, Error {
        case failedToCreateRequest
        case failedGetData
        case failedToGetCachedData
        case failedToDecodeData
        
        var message: String {
            switch self {
            case .failedToCreateRequest:
                return "Failed to create request."
            case .failedGetData:
                return "Failed to get data."
            case .failedToGetCachedData:
                return "Failed to get cached data."
            case .failedToDecodeData:
                return "Failed to get decode data."
            }
        }
    }
    
    /// Send API Call
    /// - Parameters:
    ///     - request: Request instance
    ///     - type : The type of object we expect to get back
    ///     - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: ServiceRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, ServiceError>) -> Void)
    {
         
        if let cachedData = cacheManager.cachedResponse(for: request.endpoint, url: request.url) {
            print("Using cached API response")
            do {
                let result = try JSONDecoder().decode(type.self, from: cachedData)
                completion(.success(result))
            } catch {
                completion(.failure(ServiceError.failedToGetCachedData))
            }
            return
        }
            
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(ServiceError.failedGetData))
                return
            }
            
            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                self?.cacheManager.setCache(for: request.endpoint, url: request.url, data: data)
                completion(.success(result))
            } catch {
                completion(.failure(.failedToDecodeData))
            }
        }
        task.resume()
    }
    
    private func request(from rmRequest: ServiceRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
    
}

