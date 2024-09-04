//
//  SeasonsCollectionViewCell.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 02/09/2024.
//

import UIKit

class SeasonsCollectionViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var numberOfSeasons: Int?
    private var currentSelectedSeason = 1
    var getSelectedSeasonEpisode: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCollectionView()
    }
    
    func setData(numberOfSeasons: Int?, currentSelectedSeason: Int) {
        self.numberOfSeasons = numberOfSeasons
        self.currentSelectedSeason = currentSelectedSeason
        collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0 // Remove horizontal spacing between cells
        layout.minimumInteritemSpacing = 0 // Optional: Remove vertical spacing between items in the same row

        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView!.register(UINib(nibName: String(describing: SeasonCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: "SeasonCell");
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension SeasonsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfSeasons ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasonCell", for: indexPath) as! SeasonCell
        cell.setData(seasonNumber: indexPath.item + 1, isSeasonSelected: currentSelectedSeason == indexPath.item + 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        getSelectedSeasonEpisode?(indexPath.item + 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 50)
    }
}
