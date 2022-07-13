//
//  APICaller.swift
//  Spotify
//
//  Created by ikebbeh on 7/13/22.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    public func getCurrentUserProfile(completion: @escaping (Result<UserProfile, Error>) -> Void) {
        AuthManager.shared.withValidToken { token in
            
        }
    }
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    // request for user profile
    private func createRequest(with url: URL?, completion: @escaping (URLRequest) -> Void) {
        AuthManager.shared.withValidToken { token in
            guard let apiURL = url else {
                return
            }
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            completion(request)
        }
    }
}
