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
}
