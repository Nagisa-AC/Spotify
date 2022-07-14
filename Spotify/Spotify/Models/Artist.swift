//
//  Artist.swift
//  Spotify
//
//  Created by ikebbeh on 7/14/22.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
