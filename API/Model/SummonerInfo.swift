//
//  SummonerInfo.swift
//  LeagueStats
//
//  Created by Junyu Lin on 20/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import Foundation

struct SummonerInfo: Codable{
    var iconId: Int
    var name: String
    var level: Int
    var summonerId: String
    var accountId: String
    
    enum CodingKeys: String, CodingKey {
        case iconId = "profileIconId"
        case name
        case level = "summonerLevel"
        case summonerId = "id"
        case accountId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iconId = try container.decode(Int.self, forKey: CodingKeys.iconId)
        self.name = try container.decode(String.self, forKey: CodingKeys.name)
        self.level = try container.decode(Int.self, forKey: CodingKeys.level)
        self.summonerId = try container.decode(String.self, forKey: CodingKeys.summonerId)
        self.accountId = try container.decode(String.self, forKey: CodingKeys.accountId)
    }
}
