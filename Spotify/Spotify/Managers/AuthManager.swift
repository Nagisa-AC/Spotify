//
//  AuthManager.swift
//  Spotify
//
//  Created by ikebbeh on 7/6/22.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
        
    struct Constants {
        static let clientID = "ffa53eec93614856b4c5b81ecd412261"
        static let clientSecret = "47326f29745b42c48fa575274f186b03"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let baseURL = "https://accounts.spotify.com/authorize"
        let redirectURI = "https://www.google.com"
        let scopes = "user-read-private"
        let string = "\(baseURL)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)"
        return URL(string: string)
    }
    
    
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpiration: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
}
