//
//  SearchModels.swift
//  MyMusic
//
//  Created by dzmitry on 26.04.23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Search {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getTracks(searchTerm: String)
      }
    }
      
    struct Response {
      enum ResponseType {
        case some
        case presentTracks(searchResponse: SearchResponse?)
      }
    }
      
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayTracks(searchViewModel: SearchViewModel)
      }
    }
  }
}

struct SearchViewModel {
    struct Cell: TrackCellViewModel {
        var iconUrlString: String?
        var trackName: String
        var collectionName: String
        var artistName: String
        var previewUrl: String?
    }
    
    let cells: [Cell]
}