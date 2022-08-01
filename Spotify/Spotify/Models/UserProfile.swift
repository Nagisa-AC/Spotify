//
//  UserProfile.swift
//  Spotify
//
//  Created by ikebbeh on 7/13/22.
//

import Foundation

struct UserProfile {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Bool]
    let external_urls: [String: String]
    let followers: [String: Codable?]
    let id: String
    let product: String
    let images: [APIImage]
}
