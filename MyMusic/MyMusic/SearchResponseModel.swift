//
//  SearchResponseModel.swift
//  MyMusic
//
//  Created by dzmitry on 19.04.23.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String
    var artistName: String
    var artworkUrl100: String?
}
