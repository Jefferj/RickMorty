//
//  RMService.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 11/01/23.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singlenton instance
    static let shared = RMService()
    private let cacheManager = RMAPICacheManager()
    ///Privatized constructor
    private init() {}
    enum RMServiceError: Error {
        case failedCreateRequest
        case failedToGetData
    }
    ///Send Rick and Morty API call
    ///-Parameters:
    ///  -request: Request Instance
    ///  type: The type of object we expect to get back
    ///    -completion:  Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        if let cachedData = cacheManager.cachedResponse(
            for: request.endpoint,
            url: request.url
        ) {
            do {
                let result = try JSONDecoder().decode(type.self, from: cachedData)
                completion(.success(result))
            }catch {
                completion(.failure(error))
            }
            return
        }
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            do{
                let result = try JSONDecoder().decode(type.self, from: data)
                self?.cacheManager.setCache(
                    for: request.endpoint,
                    url: request.url,
                    data: data)
                completion(.success(result))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
