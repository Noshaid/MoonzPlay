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
    let firstAirDate: String?
    let genres: [Genre]?
    let number_of_seasons: Int?
    let seasons: [Season]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case backdrop_path
        case overview
        case firstAirDate = "first_air_date"
        case genres
        case number_of_seasons
        case seasons
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}


//struct TVShow : Codable {
//    
//    let adult : Bool?
//    let backdrop_path : String?
//    let created_by : [Created_by]?
//    let episode_run_time : [Int]?
//    let first_air_date : String?
//    let genres : [Genres]?
//    let homepage : String?
//    let id : Int?
//    let in_production : Bool?
//    let languages : [String]?
//    let last_air_date : String?
//    let last_episode_to_air : Last_episode_to_air?
//    let name : String?
//    let next_episode_to_air : String?
//    let networks : [Networks]?
//    let number_of_episodes : Int?
//    let number_of_seasons : Int?
//    let origin_country : [String]?
//    let original_language : String?
//    let original_name : String?
//    let overview : String?
//    let popularity : Double?
//    let poster_path : String?
//    let production_companies : [Production_companies]?
//    let production_countries : [Production_countries]?
//    let seasons : [Season]?
//    let spoken_languages : [Spoken_languages]?
//    let status : String?
//    let tagline : String?
//    let type : String?
//    let vote_average : Double?
//    let vote_count : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case adult = "adult"
//        case backdrop_path = "backdrop_path"
//        case created_by = "created_by"
//        case episode_run_time = "episode_run_time"
//        case first_air_date = "first_air_date"
//        case genres = "genres"
//        case homepage = "homepage"
//        case id = "id"
//        case in_production = "in_production"
//        case languages = "languages"
//        case last_air_date = "last_air_date"
//        case last_episode_to_air = "last_episode_to_air"
//        case name = "name"
//        case next_episode_to_air = "next_episode_to_air"
//        case networks = "networks"
//        case number_of_episodes = "number_of_episodes"
//        case number_of_seasons = "number_of_seasons"
//        case origin_country = "origin_country"
//        case original_language = "original_language"
//        case original_name = "original_name"
//        case overview = "overview"
//        case popularity = "popularity"
//        case poster_path = "poster_path"
//        case production_companies = "production_companies"
//        case production_countries = "production_countries"
//        case seasons = "seasons"
//        case spoken_languages = "spoken_languages"
//        case status = "status"
//        case tagline = "tagline"
//        case type = "type"
//        case vote_average = "vote_average"
//        case vote_count = "vote_count"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
//        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
//        created_by = try values.decodeIfPresent([Created_by].self, forKey: .created_by)
//        episode_run_time = try values.decodeIfPresent([Int].self, forKey: .episode_run_time)
//        first_air_date = try values.decodeIfPresent(String.self, forKey: .first_air_date)
//        genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
//        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        in_production = try values.decodeIfPresent(Bool.self, forKey: .in_production)
//        languages = try values.decodeIfPresent([String].self, forKey: .languages)
//        last_air_date = try values.decodeIfPresent(String.self, forKey: .last_air_date)
//        last_episode_to_air = try values.decodeIfPresent(Last_episode_to_air.self, forKey: .last_episode_to_air)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        next_episode_to_air = try values.decodeIfPresent(String.self, forKey: .next_episode_to_air)
//        networks = try values.decodeIfPresent([Networks].self, forKey: .networks)
//        number_of_episodes = try values.decodeIfPresent(Int.self, forKey: .number_of_episodes)
//        number_of_seasons = try values.decodeIfPresent(Int.self, forKey: .number_of_seasons)
//        origin_country = try values.decodeIfPresent([String].self, forKey: .origin_country)
//        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
//        original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
//        overview = try values.decodeIfPresent(String.self, forKey: .overview)
//        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
//        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
//        production_companies = try values.decodeIfPresent([Production_companies].self, forKey: .production_companies)
//        production_countries = try values.decodeIfPresent([Production_countries].self, forKey: .production_countries)
//        seasons = try values.decodeIfPresent([Season].self, forKey: .seasons)
//        spoken_languages = try values.decodeIfPresent([Spoken_languages].self, forKey: .spoken_languages)
//        status = try values.decodeIfPresent(String.self, forKey: .status)
//        tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
//        type = try values.decodeIfPresent(String.self, forKey: .type)
//        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
//        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
//    }
//
//}
//
//struct Created_by : Codable {
//    let id : Int?
//    let credit_id : String?
//    let name : String?
//    let original_name : String?
//    let gender : Int?
//    let profile_path : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case credit_id = "credit_id"
//        case name = "name"
//        case original_name = "original_name"
//        case gender = "gender"
//        case profile_path = "profile_path"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
//        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
//        profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
//    }
//
//}
//
//struct Genres : Codable {
//    let id : Int?
//    let name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//    }
//
//}
//
//struct Last_episode_to_air : Codable {
//    let id : Int?
//    let name : String?
//    let overview : String?
//    let vote_average : Int?
//    let vote_count : Int?
//    let air_date : String?
//    let episode_number : Int?
//    let episode_type : String?
//    let production_code : String?
//    let runtime : Int?
//    let season_number : Int?
//    let show_id : Int?
//    let still_path : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//        case overview = "overview"
//        case vote_average = "vote_average"
//        case vote_count = "vote_count"
//        case air_date = "air_date"
//        case episode_number = "episode_number"
//        case episode_type = "episode_type"
//        case production_code = "production_code"
//        case runtime = "runtime"
//        case season_number = "season_number"
//        case show_id = "show_id"
//        case still_path = "still_path"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        overview = try values.decodeIfPresent(String.self, forKey: .overview)
//        vote_average = try values.decodeIfPresent(Int.self, forKey: .vote_average)
//        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
//        air_date = try values.decodeIfPresent(String.self, forKey: .air_date)
//        episode_number = try values.decodeIfPresent(Int.self, forKey: .episode_number)
//        episode_type = try values.decodeIfPresent(String.self, forKey: .episode_type)
//        production_code = try values.decodeIfPresent(String.self, forKey: .production_code)
//        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
//        season_number = try values.decodeIfPresent(Int.self, forKey: .season_number)
//        show_id = try values.decodeIfPresent(Int.self, forKey: .show_id)
//        still_path = try values.decodeIfPresent(String.self, forKey: .still_path)
//    }
//
//}
//
//struct Networks : Codable {
//    let id : Int?
//    let logo_path : String?
//    let name : String?
//    let origin_country : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case logo_path = "logo_path"
//        case name = "name"
//        case origin_country = "origin_country"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        logo_path = try values.decodeIfPresent(String.self, forKey: .logo_path)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        origin_country = try values.decodeIfPresent(String.self, forKey: .origin_country)
//    }
//
//}
//
//struct Production_companies : Codable {
//    let id : Int?
//    let logo_path : String?
//    let name : String?
//    let origin_country : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case logo_path = "logo_path"
//        case name = "name"
//        case origin_country = "origin_country"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        logo_path = try values.decodeIfPresent(String.self, forKey: .logo_path)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        origin_country = try values.decodeIfPresent(String.self, forKey: .origin_country)
//    }
//
//}
//
//struct Production_countries : Codable {
//    let iso_3166_1 : String?
//    let name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case iso_3166_1 = "iso_3166_1"
//        case name = "name"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        iso_3166_1 = try values.decodeIfPresent(String.self, forKey: .iso_3166_1)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//    }
//
//}
//
//
//struct Spoken_languages : Codable {
//    let english_name : String?
//    let iso_639_1 : String?
//    let name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case english_name = "english_name"
//        case iso_639_1 = "iso_639_1"
//        case name = "name"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        english_name = try values.decodeIfPresent(String.self, forKey: .english_name)
//        iso_639_1 = try values.decodeIfPresent(String.self, forKey: .iso_639_1)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//    }
//
//}
