//
//  NetworkManager.swift
//  TeladocTest
//
//  Created by Nikolai Lipski on 6.10.23.
//

import Foundation

protocol NetworkManagerProtocol {
    func getBeatlesAlbums(completion: @escaping ([AlbumModel]?) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    func getBeatlesAlbums(completion: @escaping ([AlbumModel]?) -> Void) {
        guard let url = URL(string: Constants.testBeatlesAlbumsUrl) else {
            completion(nil)
            return
        }
        
        getAlbums(from: url, completion: completion)
    }
    
    private func getAlbums(from iTunesUrl: URL, completion: @escaping ([AlbumModel]?) -> Void) {
        var request: URLRequest = URLRequest(url: iTunesUrl)
        request.httpMethod = "GET"
        
        // Probably it may be needed for some reasons
//        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                return completion(nil)
            }

            switch httpResponse.statusCode {
            case 200...300:
                guard let data else {
                    return completion(nil)
                }

                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                guard let responseResult: [String: Any] = json as? [String: Any],
                      let results = responseResult["results"] as? [[String : Any]],
                      let jsonData = try? JSONSerialization.data(withJSONObject: results, options: .prettyPrinted)
                else {
                    return completion(nil)
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try? decoder.decode([AlbumModel].self, from: jsonData)
                completion(result)
                
            default:
                return completion(nil)
            }
            
        }.resume()
    }
}
