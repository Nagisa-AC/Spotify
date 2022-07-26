//
//  RecommendationsResponse.swift
//  Spotify
//
//  Created by ikebbeh on 7/25/22.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
