//
//  NetworkManager.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 30/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    func getPopularTvShows(page: Int, completion: @escaping (_ popularTvShowsResponse: TvShowsResponse?, _ error: String?) -> ())
    func getTvShowsDetail(tvShowId: Int, completion: @escaping (_ tvShowDetail: TvShowDetail?, _ error: String?) -> ())
}

struct NetworkManager: NetworkManagerProtocol {
    
    static let environment: NetworkEnvironment = .production
    static let TvAPIKey = Bundle.main.theMovieDbAPIKey
    private let router = Router<TvApi>()
    
    func getPopularTvShows(page: Int, completion: @escaping (_ popularTvShowsResponse: TvShowsResponse?, _ error: String?) -> ()) {
        
        router.request(.popular(page: page)) { data, response, error in
            if error != nil { completion(nil, "Please check your network connection.") }
            
            if let response = response as? HTTPURLResponse {
                switch self.handleNetworkResponse(response) {
                    case .success:
                        guard let responseData = data else {
                            completion(nil, NetworkResponse.noData.rawValue)
                            return
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode(TvShowsResponse.self, from: responseData)
                            completion(apiResponse, nil)
                        } catch { completion(nil, NetworkResponse.unableToDecode.rawValue) }
                    case .failure(let networkFailureError): completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getTvShowsDetail(tvShowId: Int, completion: @escaping (_ tvShowDetail: TvShowDetail?, _ error: String?) -> ()) {
        
        router.request(.detail(id: tvShowId)) { data, response, error in
            if error != nil { completion(nil, "Please check your network connection.") }
            
            if let response = response as? HTTPURLResponse {
                switch self.handleNetworkResponse(response) {
                    case .success:
                        guard let responseData = data else {
                            completion(nil, NetworkResponse.noData.rawValue)
                            return
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode(TvShowDetail.self, from: responseData)
                            completion(apiResponse, nil)
                        } catch { completion(nil, NetworkResponse.unableToDecode.rawValue) }
                    case .failure(let networkFailureError): completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request."
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response"
}

enum Result<String> {
    case success
    case failure(String)
}
