//
//  MockTVShowNetworkService.swift
//  MoonzPlayTests
//
//  Created by Noshaid Ali on 04/09/2024.
//

import Foundation
import Alamofire
@testable import MoonzPlay

class MockTVShowNetworkService: TVShowNetworkServiceProtocol {
    
    let mockTVShow: TVShow
    let mockSeason: Season
    
    static let emptyMockTVShow = TVShow(id: nil, name: "Friends", backdrop_path: nil, overview: nil, first_air_date: nil, genres: nil, number_of_seasons: nil, seasons: nil)
    
    static let emptyMockSeason = Season(air_date: nil, id: nil, _id: nil, name: nil, overview: nil, poster_path: nil, season_number: nil, vote_average: nil, episodes: nil)
    
    var didFetchSeason = false
    
    init(mockTVShow: TVShow = emptyMockTVShow, mockSeason: Season = emptyMockSeason) {
        self.mockTVShow = mockTVShow
        self.mockSeason = mockSeason
    }
    
    func fetchTVShow(tvShowID: Int, onSuccess: @escaping ((MoonzPlay.TVShow) -> Void), onFailure: @escaping ((AFError) -> Void)) {
        onSuccess(mockTVShow)
    }
    
    func fetchSeason(tvShowID: Int, seasonNumber: Int, onSuccess: @escaping ((MoonzPlay.Season) -> Void), onFailure: @escaping ((AFError) -> Void)) {
        didFetchSeason = true
        onSuccess(mockSeason)
    }
    
    func fetchEpisodes(tvShowID: Int, seasonNumber: Int, episodeNumber: Int, onSuccess: @escaping ((MoonzPlay.Episode) -> Void), onFailure: @escaping ((AFError) -> Void)) {
        onFailure(AFError.sessionDeinitialized)
    }
    
    
}
