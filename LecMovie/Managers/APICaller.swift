//
//  APICaller.swift
//  LecMovie
//
//  Created by alexdamascena on 20/07/22.
//

import Foundation


struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}


class APICaller {
    
    struct Constants {
        static let DOWNLOAD_BASE_URL = "https://image.tmdb.org/t/p/w780"
        static let API_KEY = "api_key"
    }
    
    enum RequestError: Error {
        case invalidURL
        case invalidData
        case invalidUrlComponents
    }
    
    static let shared = APICaller()
    private init(){}
    
    
    static var apiKey: String {
        guard let url = Bundle.main.url(forResource: "TMDB-Info", withExtension: "plist") else {
            fatalError("Couldn't find api key configuration file.")
        }
        guard let plist = try? NSDictionary(contentsOf: url, error: ()) else {
            fatalError("Couldn't interpret api key configuration file as plist.")
        }
        guard let key = plist["API_KEY"] as? String else {
            fatalError("Couldn't find an api key in its configuration file.")
        }
        return key
    }
    
    
    func makeRequest<T: Codable>(with endpoint: Endpoint,
                                 expecting: T.Type) async -> Result<T, Error> {
        let urlComponents = URLComponents(string: "https://api.themoviedb.org/")
                
        guard var urlComponents = urlComponents else {
            return .failure(RequestError.invalidUrlComponents)
        }
        
        urlComponents.path = endpoint.path
        
        var queryItems = [ URLQueryItem(name: Constants.API_KEY, value: APICaller.apiKey) ]
        queryItems.append(contentsOf: endpoint.queryItems)
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            return .failure(RequestError.invalidURL)
        }
        
        let session = URLSession.shared
        do {
            let (data, _) = try await session.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let response = try decoder.decode(expecting, from: data)
            return .success(response)
        } catch {
            print(error)
        }
        
        return .failure(RequestError.invalidData)
    }
    
    
    static func downloadImageData(withPath: String) async -> Data {
        let urlString = "\(Constants.DOWNLOAD_BASE_URL)/\(withPath)"
        let url = URL(string: urlString)
        guard let url = url else { return Data() }

        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: url)
            return data
        } catch {
            print(error)
        }
        
        return Data()
    }
}
