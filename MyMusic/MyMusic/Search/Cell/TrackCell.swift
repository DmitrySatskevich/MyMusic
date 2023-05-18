//
//  TrackCell.swift
//  MyMusic
//
//  Created by dzmitry on 28.04.23.
//

import UIKit
import SDWebImage

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
    
    override func prepareForReuse() {
        trackImageView.image = nil
    }
    
    var cell: SearchViewModel.Cell?
    
    func set(viewModel: SearchViewModel.Cell) {
        self.cell = viewModel
        trackNameLbl.text = viewModel.trackName
        artistNameLbl.text = viewModel.artistName
        collectionNameLbl.text = viewModel.collectionName
        
        // парсинг изображения трека, используя библиотеку 'SDWebImage'
        guard let url = URL(string: viewModel.iconUrlString ?? "") else { return }
        trackImageView.sd_setImage(with: url)
    }
    
    @IBAction func addTrackAction(_ sender: Any) {
        let defaults = UserDefaults.standard
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: SearchViewModel.Cell.self,
                                                             requiringSecureCoding: false) {
            defaults.set(savedData, forKey: "tracks")
        }
    }
}
