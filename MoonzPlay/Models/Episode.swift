//
//  Episode.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 31/08/2024.
//

import Foundation


struct Episode: Codable {
    
    let air_date: String?
    let crew: [Crew]?
    let episode_number: Int?
    let name: String?
    let overview: String?
    let id: Int?
    let production_code: String?
    let runtime: Int?
    let season_number: Int?
    let still_path: String?
    let vote_average: Double?
    let vote_count: Int?
    let guest_stars: [GuestStars]?
    

    enum CodingKeys: String, CodingKey {

        case air_date
        case crew
        case episode_number
        case name
        case overview
        case id
        case production_code
        case runtime
        case season_number
        case still_path
        case vote_average
        case vote_count
        case guest_stars
    }
}

struct Crew: Codable {
    
    let job: String?
    let department: String?
    let credit_id: String?
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let known_for_department: String?
    let name: String?
    let original_name: String?
    let popularity: Double?
    let profile_path: String?
    

    enum CodingKeys: String, CodingKey {

        case job
        case department
        case credit_id
        case adult
        case gender
        case id
        case known_for_department
        case name
        case original_name
        case popularity
        case profile_path
    }
}

struct GuestStars: Codable {
    
    let character: String?
    let credit_id: String?
    let order: Int?
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let known_for_department: String?
    let name: String?
    let original_name: String?
    let popularity: Double?
    let profile_path: String?

    enum CodingKeys: String, CodingKey {

        case character
        case credit_id
        case order
        case adult
        case gender
        case id
        case known_for_department
        case name
        case original_name
        case popularity
        case profile_path
    }
}
