//
//  TVShowViewModel.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 31/08/2024.
//

import Foundation

protocol TVShowViewModelProtocol {
    var onDataUpdated: (() -> Void)? { get set }
    var tvShow: TVShow? { get }
    var season: Season? { get }
    var episode: Episode? { get }
    var currentSelectedSeason: Int { get set }
    
    func fetchTVShow(tvShowID: Int)
    func fetchSeason(tvShowID: Int, seasonNumber: Int)
    func fetchEpisode(tvShowID: Int, seasonNumber: Int, episodeNumber: Int)
    func updateSelectedSeason(seasonNumber: Int)
}

class TVShowViewModel: TVShowViewModelProtocol {
    
    let tvShowNetworkService: TVShowNetworkServiceProtocol
    var onDataUpdated: (() -> Void)?
    
    var tvShow: TVShow?
    var season: Season?
    var episode: Episode?
    
    var currentSelectedSeason = 1
    
    init(tvShowNetworkService: TVShowNetworkServiceProtocol, onDataUpdated: (() -> Void)? = nil, tvShow: TVShow? = nil, season: Season? = nil, episode: Episode? = nil, currentSelectedSeason: Int = 1) {
        self.tvShowNetworkService = tvShowNetworkService
        self.onDataUpdated = onDataUpdated
        self.tvShow = tvShow
        self.season = season
        self.episode = episode
        self.currentSelectedSeason = currentSelectedSeason
    }
    
    func fetchTVShow(tvShowID: Int) {
        tvShowNetworkService.fetchTVShow(tvShowID: tvShowID) { [weak self] tvShow in
            self?.tvShow = tvShow
            self?.onDataUpdated?()
            self?.fetchSeason(tvShowID: _TV_SHOW_ID, seasonNumber: 1)
        } onFailure: { error in
            print(error)
        }
    }
    
    func fetchSeason(tvShowID: Int, seasonNumber: Int) {
        tvShowNetworkService.fetchSeason(tvShowID: tvShowID, seasonNumber: seasonNumber) { [weak self] season in
            self?.season = season
            self?.onDataUpdated?()
            //self?.fetchEpisode(tvShowID: _TV_SHOW_ID, seasonNumber: 1, episodeNumber: 1)
        } onFailure: { error in
            print(error)
        }
    }
    
    func fetchEpisode(tvShowID: Int, seasonNumber: Int, episodeNumber: Int) {
        tvShowNetworkService.fetchEpisodes(tvShowID: tvShowID, seasonNumber: seasonNumber, episodeNumber: episodeNumber) { [weak self] episode in
            self?.episode = episode
            self?.onDataUpdated?()
        } onFailure: { error in
            print(error)
        }
    }
    
    func updateSelectedSeason(seasonNumber: Int) {
        currentSelectedSeason = seasonNumber
    }
    
}
