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
    
    var episode: Episode? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setData() {
        titleLbl.text = "E\(episode?.episode_number ?? 0) - \(episode?.name ?? "")"
        if let stillPath = episode?.still_path {
            let thumbnailUrlURL = URL(string: "\(_IMAGE_BASE_URL)\(stillPath)")
            thumbnailImgView.sd_setImage(with: thumbnailUrlURL, placeholderImage: UIImage(named: "episode"))
        } else {
            thumbnailImgView.image = UIImage(named: "episode")
        }
    }
    
    @IBAction func dowloadVideoAction(_ sender: Any) {
        DownloadManager.shared.downloadAndSaveVideo()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
