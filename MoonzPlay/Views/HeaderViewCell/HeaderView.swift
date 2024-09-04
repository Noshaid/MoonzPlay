//
//  HeaderView.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 01/09/2024.
//

import UIKit
import SDWebImage

class HeaderView: UITableViewCell {

    @IBOutlet weak var backDropImgView: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var shortInfoLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var readMoreBtn: UIButton!
    
    private var isExpanded = false
    var playVideo: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupGradientBackground()
    }
    
    func setData(tvShow: TVShow?) {
        nameLbl.text = "\(tvShow?.name ?? "Season Name")"
        shortInfoLbl.text = "\(tvShow?.firstAirDate ?? "")  |  \(tvShow?.number_of_seasons ?? 0) Seasons  |  R"
        descriptionLbl.text = "\(tvShow?.overview ?? "")"
        setDescriptionUI()
        
        if let backdropPath = tvShow?.backdrop_path {
            let posterURL = URL(string: "\(_IMAGE_BASE_URL)\(backdropPath)")
            backDropImgView.sd_setImage(with: posterURL)
        }
    }

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.backgroundColor.cgColor, UIColor.backgroundColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setDescriptionUI() {
        descriptionLbl.numberOfLines = isExpanded ? 0 : 2
        readMoreBtn.setTitle(isExpanded ? "Read Less" : "Read More", for: .normal)
    }
    
    @IBAction func readMoreAction(_ sender: Any) {
        isExpanded.toggle()
        setDescriptionUI()
        if let tableView = superview as? UITableView {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    @IBAction func playBtnAction(_ sender: Any) {
        playVideo?()
    }
    
    @IBAction func trailerBtnAction(_ sender: Any) {
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

