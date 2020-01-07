//
//  LeagueEntry.swift
//  LeagueStats
//
//  Created by Junyu Lin on 7/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import Foundation

struct LeagueEntry: Codable{
    var wins, losses, leaguePoints: Int
    var rank: String
    var tier: String
    
    enum LeagueEntryCodingKeys: String, CodingKey{
        case wins
        case losses
        case leaguePoints
        case rank
        case tier
    }
    
    init(_ decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: LeagueEntryCodingKeys.self)
        self.wins = try container.decode(Int.self, forKey: LeagueEntryCodingKeys.wins)
        self.losses = try container.decode(Int.self, forKey: LeagueEntryCodingKeys.losses)
        self.leaguePoints = try container.decode(Int.self, forKey: LeagueEntryCodingKeys.leaguePoints)
        self.rank = try container.decode(String.self, forKey: LeagueEntryCodingKeys.rank)
        self.tier = try container.decode(String.self, forKey: LeagueEntryCodingKeys.rank)
    }
}
