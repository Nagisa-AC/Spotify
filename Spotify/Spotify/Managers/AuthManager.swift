//
//  AuthManager.swift
//  Spotify
//
//  Created by ikebbeh on 7/6/22.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private var refreshingToken = false
        
    struct Constants {
        static let clientID = "ffa53eec93614856b4c5b81ecd412261"
        static let clientSecret = "47326f29745b42c48fa575274f186b03"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
        static let redirectURI = "https://www.google.com"
        static let scopes = "user-read-private"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let baseURL = "https://accounts.spotify.com/authorize"
        let redirectURI = "https://www.google.com"
        let string = "\(baseURL)?response_type=code&client_id=\(Constants.clientID)&scope=\(Constants.scopes)&redirect_uri=\(Constants.redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    
    
    var isSignedIn: Bool {
        return accessToken != nil
    }
    
    private var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
    private var refreshToken: String? {
        return UserDefaults.standard.string(forKey: "refresh_token")
    }
    
    private var tokenExpirationDate: Date? {
        return UserDefaults.standard.object(forKey: "expirationDate") as? Date
    }
    
    private var shouldRefreshToken: Bool {
        guard let expirationDate = tokenExpirationDate else {
            return false 
        }
        let currentDate = Date()
        let fiveMiinutes: TimeInterval = 300
        return currentDate.addingTimeInterval(fiveMiinutes) >= expirationDate
    }
    
    /**
    When user authorizes their account an authorization code is generated.
    Spotify allows you to exchange a code for a access token. The purpose
    of this method is to exchange the authorization code for an access token.
    Reequired body parameters: grant_type, auth code, and redirect_url.
    Required header parameter: Authorization (clientID and client Secret)
    https://developer.spotify.com/documentation/general/guides/authorization/code-flow/
     */
    
    public func exchangeCodeForToken(
        code: String,
        completion: @escaping ((Bool) -> Void)
    ) {
        guard let url = URL(string: Constants.tokenAPIURL) else {
            return
        }
                
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI)
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        // HTTP Auth header
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("base64 failure")
            completion(false)
            return
        }
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data,
                  error == nil else {
                completion(false)
                return
            }
            
            // desearlize json
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                completion(true)
//                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
//                self.cacheToken(result: result)
//                completion(true)
            }
            catch {
                print(error.localizedDescription)
                completion(false)
            }
            
        }
        task.resume()
    }
    
    public func withValidToken(completion: @escaping (String) -> Void) {
        if shouldRefreshToken {
            refreshIfNeeded { [weak self] success in
                if success {
                    if let token = self?.accessToken, success {
                        completion(token)
                    }
                }
            }
        }
        else if let token = accessToken {
            completion(token)
        }
    }
    
    
    
    public func refreshIfNeeded(completion: @escaping (Bool) -> Void) {
        guard !refreshingToken else {
            return 
        }
        
//        guard shouldRefreshToken else {
//            completion(true)
//            return
//        }
        guard let refreshToken = self.refreshToken else {
            return
        }
        
        // refresh the token
        guard let url = URL(string: Constants.tokenAPIURL) else {
            return
        }
        
        refreshingToken = true
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "refresh_token"),
            URLQueryItem(name: "refresh_token", value: refreshToken)
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        // HTTP Auth header
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("base64 failure")
            completion(false)
            return
        }
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data,
                  error == nil else {
                completion(false)
                return
            }
            
            // desearlize json
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                completion(true)
//                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
//                self.cacheToken(result: result)
//                completion(true)
            }
            catch {
                print(error.localizedDescription)
                completion(false)
            }
            
        }
        task.resume()

    }
    
    private func cacheToken(result: AuthResponse) {
        UserDefaults.standard.setValue(result.access_token,
                                       forKey: "access_token")
        if let refresh_token = result.refresh_token {
            UserDefaults.standard.setValue(result.refresh_token,
                                           forKey: "refresh_token")
        }
        
        // current time user logs in and num of seconds token expires
        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expires_in)),
                                       forKey: "expirationDate")
    }
}
