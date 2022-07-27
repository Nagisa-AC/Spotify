//
//  PlaylistDetailsResponse.swift
//  Spotify
//
//  Created by ikebbeh on 7/27/22.
//

import Foundation


struct PlaylistDetailsResponse: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let tracks: TracksResponse
}

