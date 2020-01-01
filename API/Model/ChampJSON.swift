//
//  File.swift
//  LeagueStats
//
//  Created by Junyu Lin on 1/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import Foundation

struct ChampJSON: Codable{
    var data: [Champion]
    
    enum ChampJSONCodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ChampJSONCodingKeys.self)
        self.data = try container.decode([Champion].self, forKey: ChampJSONCodingKeys.data);
    }
}

struct Champion: Codable{
    var key: Int
    var image: ChampImage
    
    enum ChampionCodingKeys: String, CodingKey{
        case key
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ChampionCodingKeys.self)
        self.key = try container.decode(Int.self, forKey: ChampionCodingKeys.key)
        self.image = try container.decode(ChampImage.self, forKey: ChampionCodingKeys.image)
    }
}

struct ChampImage: Codable{
    var full: String
    
    enum ImageCodingKeys: String, CodingKey{
        case full
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ImageCodingKeys.self)
        self.full = try container.decode(String.self, forKey: ImageCodingKeys.full)
    }
}
