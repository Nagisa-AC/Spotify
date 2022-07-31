//
//  SearchResult.swift
//  Spotify
//
//  Created by ikebbeh on 7/29/22.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}

