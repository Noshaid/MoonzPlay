//
//  TVShowViewController.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 30/08/2024.
//

import UIKit

class TVShowViewController: UIViewController {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    private var tvShowViewModel: TVShowViewModelProtocol
    private static let storyboardIdentifier = "TVShowViewController"

    // MARK: Initializations
    static func createTVShowViewController(tvShowViewModel: TVShowViewModelProtocol) -> TVShowViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: self.storyboardIdentifier) { aCoder in
            return TVShowViewController(tvShowViewModel: tvShowViewModel, coder: aCoder)
        }
        return vc
    }

    init?(tvShowViewModel: TVShowViewModelProtocol, coder: NSCoder) {
        self.tvShowViewModel = tvShowViewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
        resetData()
    }
    
    private func setupUI() {
        loader.isHidden = false
        tableView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: HeaderView.self), bundle: Bundle.main), forCellReuseIdentifier: "HeaderView")
        tableView.register(UINib(nibName: String(describing: SeasonsCollectionViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: "SeasonsCollectionViewCell")
        tableView.register(UINib(nibName: String(describing: EpisodeCell.self), bundle: Bundle.main), forCellReuseIdentifier: "EpisodeCell")
        
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    private func setupBindings() {
        // Bind the view model to update UI when data updates
        tvShowViewModel.onDataUpdated = { [weak self] in
            self?.updateUI()
        }
    }
    
    private func resetData() {
        tvShowViewModel.fetchTVShow(tvShowID: _TV_SHOW_ID)
    }
    
    private func updateUI() {
        loader.isHidden = true
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    @objc private func refreshData() {
        resetData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { 
            [weak self] in
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
    
    private func showVideoPlayerViewController() {
        let url = URL(string: _SAMPLE_VIDEO_URL)
        let videoPlayerVC = VideoPlayerViewController(videoURL: url)
        self.present(videoPlayerVC, animated: true, completion: nil)
    }
}

// MARK: TableView Deletgate and Datasource
extension TVShowViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0, 1:
                return 1
            default:
                return tvShowViewModel.season?.episodes?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
            case 0:
                let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderView") as! HeaderView
                headerCell.tvShow = tvShowViewModel.tvShow
                headerCell.playVideo = {
                    [weak self] in
                    self?.showVideoPlayerViewController()
                }
                cell = headerCell
            case 1:
                let seasonsCollectionViewCell = tableView.dequeueReusableCell(withIdentifier: "SeasonsCollectionViewCell") as! SeasonsCollectionViewCell
                seasonsCollectionViewCell.numberOfSeasons = tvShowViewModel.tvShow?.number_of_seasons ?? 0
                seasonsCollectionViewCell.currentSelectedSeason = tvShowViewModel.currentSelectedSeason
                seasonsCollectionViewCell.getSelectedSeasonEpisode = {
                    [weak self] seasonNumber in
                    self?.tvShowViewModel.updateSelectedSeason(seasonNumber: seasonNumber)
                    self?.tvShowViewModel.fetchSeason(tvShowID: _TV_SHOW_ID, seasonNumber: seasonNumber)
                }
                cell = seasonsCollectionViewCell
            default:
                let episodeCell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell") as! EpisodeCell
                episodeCell.episode = tvShowViewModel.season?.episodes?[indexPath.row]
                cell = episodeCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return UITableView.automaticDimension
            case 1:
                return tvShowViewModel.tvShow?.number_of_seasons == 0 ? 0 : 50
            default:
                return 120
        }
    }
}

