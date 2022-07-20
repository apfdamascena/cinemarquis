//
//  URLSession+Request.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.
//

import Foundation


extension URLSession {
    
    enum RequestError: Error {
        case invalidURL
        case invalidData
    }
    
    func request<T: Codable>(
        url: URL?,
        exepecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = url else {
            completion(.failure(RequestError.invalidURL))
            return
        }
        
        let task = self.dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(RequestError.invalidData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(exepecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

