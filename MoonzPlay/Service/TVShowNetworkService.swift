//
//  TVShowNetworkService.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 03/09/2024.
//

import Foundation
import Alamofire
import MPNetworkPacakage

//protocol NetowkService {
//    //var networkManager: NetworkManagerProtocol { get }
//}

//class MockNetworkManager: NetworkManagerProtocol {
//    
//    func makeCall<T>(withUrl url: URL, completion: @escaping (Result<T, Alamofire.AFError>) -> Void) where T : Decodable, T : Encodable {
//        completion(.success(TVShow()))
//    }
//}

final class TVShowNetworkService {
    
    let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

//    func fetchCurrencyData(function: AppConstants.FunctionType, currencyCode: AppConstants.DigitalCurrencyCode, marketCode: AppConstants.MarketCode, onSuccess: @escaping ((DigitalCurrencyDTO) -> Void), onFailure: @escaping ((NetworkError) -> Void) ) {
//        let queryParams: QueryParams = ["function": function.rawValue, "symbol": currencyCode.rawValue, "market": marketCode.rawValue, "apikey": AppConstants.ApiConstants.apiKey.rawValue]
//        let currencyEndpoint = HiEndpoint.query(queryParams: queryParams)
//        self.networkManager.makeCall(withEndPoint: currencyEndpoint)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .failure(let err):
//                    onFailure(err)
//                case .finished:
//                    break
//                }
//            }, receiveValue: { (currencyDTO: DigitalCurrencyDTO) in
//                onSuccess(currencyDTO)
//            })
//            .store(in: &cancellables)
//    }
    
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
