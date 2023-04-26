//
//  NetworkService.swift
//  MyMusic
//
//  Created by dzmitry on 25.04.23.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, competition: @escaping(SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term":"\(searchText)",
                         "limit":"15",
                          "media":"music"]
        
        AF.request(url, method: .get, parameters: parameters, encoding:
            URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error data: \(error.localizedDescription)")
                competition(nil)
                return
            }
            
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                print("objects:", objects)
                competition(objects)
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                competition(nil)
            }
        }
    }
}
