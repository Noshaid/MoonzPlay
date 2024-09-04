//
//  TVShow.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 31/08/2024.
//

import Foundation

struct TVShow: Codable {
    
    let id: Int?
    let name: String?
    let backdrop_path: String?
    let overview: String?
    let first_air_date: String?
    let genres: [Genre]?
    let number_of_seasons: Int?
    let seasons: [Season]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case backdrop_path
        case overview
        case first_air_date
        case genres
        case number_of_seasons
        case seasons
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}
