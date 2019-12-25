//
//  MatchDetail.swift
//  LeagueStats
//
//  Created by Junyu Lin on 22/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import Foundation

struct ParticipantId: Codable{
    var player: Player
    var id: Int
    
    enum ParticipantIdCodingKeys: String, CodingKey{
        case player
        case id = "participantId"
    }
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: ParticipantIdCodingKeys.self)
        self.player = try container.decode(Player.self, forKey: ParticipantIdCodingKeys.player)
        self.id = try container.decode(Int.self, forKey: ParticipantIdCodingKeys.id)
    }
}

struct Player: Codable{
    var name: String
    
    enum PlayerCodingKeys: String, CodingKey{
        case name = "summonerName"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: PlayerCodingKeys.self)
        self.name = try container.decode(String.self, forKey: PlayerCodingKeys.name)
    }
}

struct Participant: Codable{
    var teamId: Int
    var participantId: Int
    
    enum ParticipantCodingKeys: String, CodingKey{
        case teamId
        case participantId
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: ParticipantCodingKeys.self)
        self.teamId = try container.decode(Int.self, forKey: ParticipantCodingKeys.teamId)
        self.participantId = try container.decode(Int.self, forKey: ParticipantCodingKeys.participantId)
    }
}

struct Team: Codable{
    var teamId: Int
    var win: String
    
    enum TeamCodingKeys: String, CodingKey{
        case teamId
        case win
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: TeamCodingKeys.self)
        self.teamId = try container.decode(Int.self, forKey: TeamCodingKeys.teamId)
        self.win = try container.decode(String.self, forKey: TeamCodingKeys.win)
    }
}

struct MatchDetail: Codable{
    var duration: Int
    var participandIds: [ParticipantId]
    var participants: [Participant]
    var teams: [Team]
    
    enum MatchDetailCodingKeys: String, CodingKey{
        case participandIds = "participantIdentities"
        case duration = "gameDuration"
        case participants
        case teams
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: MatchDetailCodingKeys.self)
        self.participandIds = try container.decode([ParticipantId].self, forKey: MatchDetailCodingKeys.participandIds)
        self.duration = try container.decode(Int.self, forKey: MatchDetailCodingKeys.duration)
        self.participants = try container.decode([Participant].self, forKey: MatchDetailCodingKeys.participants)
        self.teams = try container.decode([Team].self, forKey: MatchDetailCodingKeys.teams)
    }
}
