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

        case id = "id"
        case name = "name"
        case overview = "overview"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
        case air_date = "air_date"
        case episode_number = "episode_number"
        case production_code = "production_code"
        case runtime = "runtime"
        case season_number = "season_number"
        case still_path = "still_path"
        case crew = "crew"
        case guest_stars = "guest_stars"
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

        case job = "job"
        case department = "department"
        case credit_id = "credit_id"
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
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

        case character = "character"
        case credit_id = "credit_id"
        case order = "order"
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
    }
}
