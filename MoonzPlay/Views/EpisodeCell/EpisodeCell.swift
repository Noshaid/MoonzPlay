//
//  EpisodeCell.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 01/09/2024.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var thumbnailImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var downloadLoader: UIActivityIndicatorView!
    
    var videoDownloaded: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        downloadLoader.isHidden = true
    }
    
    func setData(episode: Episode?) {
        titleLbl.text = "E\(episode?.episode_number ?? 0) - \(episode?.name ?? "")"
        if let stillPath = episode?.still_path {
            let thumbnailUrlURL = URL(string: "\(_IMAGE_BASE_URL)\(stillPath)")
            thumbnailImgView.sd_setImage(with: thumbnailUrlURL)
        }
    }
    
    @IBAction func dowloadVideoAction(_ sender: Any) {
        downloadLoader.isHidden = false
        downloadLoader.startAnimating()
        downloadBtn.isHidden = true
        DownloadManager.shared.downloadAndSaveVideo { [weak self] status in
            DispatchQueue.main.async {
                self?.downloadLoader.isHidden = true
                self?.downloadBtn.isHidden = false
                if status {
                    self?.videoDownloaded?(status)
                }
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
