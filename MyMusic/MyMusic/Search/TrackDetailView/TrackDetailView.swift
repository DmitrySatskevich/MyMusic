//
//  TrackDetailView.swift
//  MyMusic
//
//  Created by dzmitry on 6.05.23.
//

import UIKit
import AVKit

class TrackDetailView: UIView {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var trackTitleLbl: UILabel!
    @IBOutlet weak var playPauseBtn: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false // снижаем задержку загрузки до минимума
        return avPlayer
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: SearchViewModel.Cell) {
        trackTitleLbl.text = viewModel.trackName
        artistNameLbl.text = viewModel.artistName
        playTrack(previewUrl: viewModel.previewUrl)
        
        //метод позволяет загрузить картинку в тех размерах, которые нам необходимы
        let string600 = viewModel.iconUrlString?.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600 ?? "") else { return }
        trackImageView.sd_setImage(with: url)
    }
    
    private func playTrack(previewUrl: String?) {
        guard let url = URL(string: previewUrl ?? "") else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    @IBAction func dragDownButtonTapped(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBAction func handleCurrentTimeSlider(_ sender: Any) {
    }
    
    @IBAction func handleVolumeSlider(_ sender: Any) {
    }
    
    @IBAction func previousTrack(_ sender: Any) {
    }
    
    @IBAction func nextTrack(_ sender: Any) {
    }
    
    @IBAction func playPauseAction(_ sender: Any) {
        let diceArray = #imageLiteral(resourceName: "pause") // let diceArray = #imageLiteral(
        if player.timeControlStatus == .paused {
            player.play()
            playPauseBtn.setImage(diceArray, for: .normal)
        } else {
            player.pause()
            playPauseBtn.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
    }
}
