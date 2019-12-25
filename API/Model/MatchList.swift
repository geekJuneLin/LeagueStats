//
//  Match.swift
//  LeagueStats
//
//  Created by Junyu Lin on 21/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import Foundation

struct MatchList: Codable{
    var match: [Match]
    
    enum MatchListCodingKeys: String, CodingKey {
        case match = "matches"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: MatchListCodingKeys.self)
        self.match = try container.decode([Match].self, forKey: MatchListCodingKeys.match)
    }
}

struct Match: Codable{
    var lane: String
    var gameId: Float64
    var champion: Int
    var role: String
    
    enum MatchCodingKey: String, CodingKey {
        case lane
        case gameId
        case champion
        case role
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: MatchCodingKey.self)
        self.lane = try container.decode(String.self, forKey: MatchCodingKey.lane)
        self.gameId = try container.decode(Float64.self, forKey: MatchCodingKey.gameId)
        self.champion = try container.decode(Int.self, forKey: MatchCodingKey.champion)
        self.role = try container.decode(String.self, forKey: MatchCodingKey.role)
    }
}
