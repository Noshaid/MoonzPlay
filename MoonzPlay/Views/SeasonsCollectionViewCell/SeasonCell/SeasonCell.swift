//
//  SeasonCell.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 02/09/2024.
//

import UIKit

class SeasonCell: UICollectionViewCell {

    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    var seasonNumber: Int? {
        didSet {
            title.text = "SEASON \(seasonNumber ?? 0)"
            separator.isHidden = seasonNumber == 1
        }
    }
    
    var isSeasonSelected: Bool? {
        didSet {
            if isSeasonSelected == true {
                selectedView.isHidden = false
                title.textColor = .white
            } else {
                selectedView.isHidden = true
                title.textColor = .greyTextColor
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
