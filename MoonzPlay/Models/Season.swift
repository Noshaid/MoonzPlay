//
//  Season.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 31/08/2024.
//

import Foundation

struct Season: Codable {
    
    let air_date: String?
    //let episode_count: Int?
    let id: Int?
    let _id: String?
    let name: String?
    let overview: String?
    let poster_path: String?
    let season_number: Int?
    let vote_average: Double?
    let episodes: [Episode]?

    enum CodingKeys: String, CodingKey {

        case air_date = "air_date"
        //case episode_count = "episode_count"
        case id = "id"
        case _id = "_id"
        case name = "name"
        case overview = "overview"
        case poster_path = "poster_path"
        case season_number = "season_number"
        case vote_average = "vote_average"
        case episodes = "episodes"
    }
}
