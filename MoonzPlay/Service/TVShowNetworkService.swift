//
//  TVShowNetworkService.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 03/09/2024.
//

import Foundation
import Alamofire
import MPNetworkPacakage

protocol TVShowNetworkServiceProtocol {
    
    func fetchTVShow(tvShowID: Int, onSuccess: @escaping ((TVShow) -> Void), onFailure: @escaping ((AFError) -> Void))
    func fetchSeason(tvShowID: Int, seasonNumber: Int, onSuccess: @escaping ((Season) -> Void), onFailure: @escaping ((AFError) -> Void))
    func fetchEpisodes(tvShowID: Int, seasonNumber: Int, episodeNumber: Int, onSuccess: @escaping ((Episode) -> Void), onFailure: @escaping ((AFError) -> Void))
}

final class TVShowNetworkService: TVShowNetworkServiceProtocol {
    
    let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchTVShow(tvShowID: Int, onSuccess: @escaping ((TVShow) -> Void), onFailure: @escaping ((AFError) -> Void)) {
        let url = "\(_BASE_URL)/tv/\(tvShowID)?api_key=\(_API_KEY)"
        networkManager.makeCall(withUrl: URL(string: url)!) { (result: Result<TVShow, AFError>) in
            switch result {
                case .success(let tvShow):
                    onSuccess(tvShow)
                case .failure(let error):
                    onFailure(error)
            }
        }
    }
    
    func fetchSeason(tvShowID: Int, seasonNumber: Int, onSuccess: @escaping ((Season) -> Void), onFailure: @escaping ((AFError) -> Void)) {
        let url = "\(_BASE_URL)/tv/\(tvShowID)/season/\(seasonNumber)?api_key=\(_API_KEY)"
        networkManager.makeCall(withUrl: URL(string: url)!) { (result: Result<Season, AFError>) in
            switch result {
                case .success(let season):
                    onSuccess(season)
                case .failure(let error):
                    onFailure(error)
            }
        }
    }

    func fetchEpisodes(tvShowID: Int, seasonNumber: Int, episodeNumber: Int, onSuccess: @escaping ((Episode) -> Void), onFailure: @escaping ((AFError) -> Void)) {
        let url = "\(_BASE_URL)/tv/\(tvShowID)/season/\(episodeNumber)?api_key=\(_API_KEY)"
        networkManager.makeCall(withUrl: URL(string: url)!) { (result: Result<Episode, AFError>) in
            switch result {
                case .success(let episode):
                    onSuccess(episode)
                case .failure(let error):
                    onFailure(error)
            }
        }
    }
}
