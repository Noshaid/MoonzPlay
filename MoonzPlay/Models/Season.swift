//
//  Season.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 31/08/2024.
//

import Foundation

struct Season: Codable {
    
    let air_date: String?
    let id: Int?
    let _id: String?
    let name: String?
    let overview: String?
    let poster_path: String?
    let season_number: Int?
    let vote_average: Double?
    let episodes: [Episode]?

    enum CodingKeys: String, CodingKey {

        case air_date
        case id
        case _id
        case name
        case overview
        case poster_path
        case season_number
        case vote_average
        case episodes
    }
}
