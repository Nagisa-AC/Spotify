//
//  AuthManager.swift
//  Spotify
//
//  Created by ikebbeh on 7/6/22.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
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
