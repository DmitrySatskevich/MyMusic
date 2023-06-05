//
//  UserDefaults.swift
//  MyMusic
//
//  Created by dzmitry on 18.05.23.
//

import Foundation

extension UserDefaults {
    
    static let favoriteTrackKey = "favouriteTrackKey"
    
    func savedTracks() -> [SearchViewModel.Cell] {
        let defaults = UserDefaults.standard
        
        guard let savedTracks = defaults.object(forKey: UserDefaults
            .favoriteTrackKey) as? Data else { return [] }
        guard let decodedTracks = try? NSKeyedUnarchiver
            .unarchiveTopLevelObjectWithData(savedTracks) as? [SearchViewModel.Cell] else { return [] }
        
        return decodedTracks
    }
}
