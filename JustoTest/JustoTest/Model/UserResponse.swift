//
//  UserResponse.swift
//  JustoTest
//
//  Created by Alan Eduardo Benavides Lira on 01/08/23.
//

import Foundation

// MARK: - Welcome
struct UserResponse: Codable {
    let results: [Result]
    let info: Info
    
    enum CodingKeys: String, CodingKey {
        case results
        case info
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([Result].self, forKey: .results)
        self.info = try container.decode(Info.self, forKey: .info)
    }
}

// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
    
    enum CodingKeys: String, CodingKey {
        case seed
        case results
        case page
        case version
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.seed = try container.decode(String.self, forKey: .seed)
        self.results = try container.decode(Int.self, forKey: .results)
        self.page = try container.decode(Int.self, forKey: .page)
        self.version = try container.decode(String.self, forKey: .version)
    }
}

// MARK: - Result
struct Result: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let dob: Dob
    let phone: String
    let picture: Picture
    let nat: String
    
    enum CodingKeys: String, CodingKey {
        case gender
        case name
        case location
        case email
        case dob
        case phone
        case picture
        case nat
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.name = try container.decode(Name.self, forKey: .name)
        self.location = try container.decode(Location.self, forKey: .location)
        self.email = try container.decode(String.self, forKey: .email)
        self.dob = try container.decode(Dob.self, forKey: .dob)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.picture = try container.decode(Picture.self, forKey: .picture)
        self.nat = try container.decode(String.self, forKey: .nat)
    }
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case date
        case age
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.age = try container.decode(Int.self, forKey: .age)
    }
}

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Int
    let coordinates: Coordinates
    
    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
        case country
        case postcode
        case coordinates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(Street.self, forKey: .street)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        self.country = try container.decode(String.self, forKey: .country)
        self.postcode = try container.decode(Int.self, forKey: .postcode)
        self.coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
    }
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.longitude = try container.decode(String.self, forKey: .longitude)
    }
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case number
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Int.self, forKey: .number)
        self.name = try container.decode(String.self, forKey: .name)
    }
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case first
        case last
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.first = try container.decode(String.self, forKey: .first)
        self.last = try container.decode(String.self, forKey: .last)
    }
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.large = try container.decode(String.self, forKey: .large)
        self.medium = try container.decode(String.self, forKey: .medium)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}
