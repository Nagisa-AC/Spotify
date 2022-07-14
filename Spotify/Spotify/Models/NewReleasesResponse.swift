//
//  NewReleasesResponse.swift
//  Spotify
//
//  Created by ikebbeh on 7/14/22.
//

import Foundation

struct NewReleasesResponse: Codable {
    let albums: AlbumsResponse
}


struct AlbumsResponse: Codable {
    let items: [Album]
}

struct Album: Codable {
    let album_type: String
    let available_markets: [String]
    let id: String
    let images = 
}

