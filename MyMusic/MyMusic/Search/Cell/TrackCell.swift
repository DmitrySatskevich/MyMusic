//
//  TrackCell.swift
//  MyMusic
//
//  Created by dzmitry on 28.04.23.
//

import UIKit

protocol TrackCellViewModel {
    var iconUrlString: String? { get }
    var trackName: String { get }
    var collectionName: String { get }
    var artistName: String { get }
}

class TrackCell: UITableViewCell {
    
    static let reuseId = "TrackCell"
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLbl: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var collectionNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: TrackCellViewModel) {
        trackNameLbl.text = viewModel.trackName
        artistNameLbl.text = viewModel.artistName
        collectionNameLbl.text = viewModel.collectionName
    }
    
}
