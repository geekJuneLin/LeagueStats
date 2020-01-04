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

struct Stats: Codable{
    var win: Bool
    var magicDamageDealtToChampions: Int32
    var doubleKills: Int
    var tripleKills: Int
    var quadraKills: Int
    var pentaKills: Int
    var kills: Int
    var deaths: Int
    var assists: Int
    var neutralMinionsKilled: Int
    var totalMinionsKilled:  Int
    var totalDamageDealtToChampions: Int32
    var item0: Int
    var item1: Int
    var item2: Int
    var item3: Int
    var item4: Int
    var item5: Int
    var item6: Int
    var perkPrimaryStyle: Int
    var perkSubStyle: Int
    var champLevel: Int
    var goldEarned: Int
    
    enum StatsCodingKeys: String, CodingKey{
        case win
        case magicDamageDealtToChampions
        case doubleKills
        case tripleKills
        case quadraKills
        case pentaKills
        case kills
        case deaths
        case assists
        case neutralMinionsKilled
        case totalMinionsKilled
        case totalDamageDealtToChampions
        case item0
        case item1
        case item2
        case item3
        case item4
        case item5
        case item6
        case perkPrimaryStyle
        case perkSubStyle
        case champLevel
        case goldEarned
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StatsCodingKeys.self)
        self.win =  try container.decode(Bool.self, forKey: StatsCodingKeys.win)
        self.magicDamageDealtToChampions =  try container.decode(Int32.self, forKey: StatsCodingKeys.magicDamageDealtToChampions)
        self.doubleKills =  try container.decode(Int.self, forKey: StatsCodingKeys.doubleKills)
        self.tripleKills =  try container.decode(Int.self, forKey: StatsCodingKeys.tripleKills)
        self.quadraKills =  try container.decode(Int.self, forKey: StatsCodingKeys.quadraKills)
        self.pentaKills =  try container.decode(Int.self, forKey: StatsCodingKeys.pentaKills)
        self.kills =  try container.decode(Int.self, forKey: StatsCodingKeys.kills)
        self.deaths =  try container.decode(Int.self, forKey: StatsCodingKeys.deaths)
        self.assists =  try container.decode(Int.self, forKey: StatsCodingKeys.assists)
        self.neutralMinionsKilled =  try container.decode(Int.self, forKey: StatsCodingKeys.neutralMinionsKilled)
        self.totalMinionsKilled =  try container.decode(Int.self, forKey: StatsCodingKeys.totalMinionsKilled)
        self.totalDamageDealtToChampions =  try container.decode(Int32.self, forKey: StatsCodingKeys.totalDamageDealtToChampions)
        self.item0 =  try container.decode(Int.self, forKey: StatsCodingKeys.item0)
        self.item1 =  try container.decode(Int.self, forKey: StatsCodingKeys.item1)
        self.item2 =  try container.decode(Int.self, forKey: StatsCodingKeys.item2)
        self.item3 =  try container.decode(Int.self, forKey: StatsCodingKeys.item3)
        self.item4 =  try container.decode(Int.self, forKey: StatsCodingKeys.item4)
        self.item5 =  try container.decode(Int.self, forKey: StatsCodingKeys.item5)
        self.item6 = try container.decode(Int.self, forKey: StatsCodingKeys.item6)
        self.perkPrimaryStyle =  try container.decode(Int.self, forKey: StatsCodingKeys.perkPrimaryStyle)
        self.perkSubStyle =  try container.decode(Int.self, forKey: StatsCodingKeys.perkSubStyle)
        self.champLevel =  try container.decode(Int.self, forKey: StatsCodingKeys.champLevel)
        self.goldEarned = try container.decode(Int.self, forKey: StatsCodingKeys.goldEarned)
    }
}

struct Participant: Codable{
    var teamId: Int
    var participantId: Int
    var spell1Id, spell2Id: Int
    var championId: Int
    var stats: Stats
    
    enum ParticipantCodingKeys: String, CodingKey{
        case teamId
        case participantId
        case spell1Id
        case spell2Id
        case championId
        case stats
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: ParticipantCodingKeys.self)
        self.teamId = try container.decode(Int.self, forKey: ParticipantCodingKeys.teamId)
        self.participantId = try container.decode(Int.self, forKey: ParticipantCodingKeys.participantId)
        self.spell1Id = try container.decode(Int.self, forKey: ParticipantCodingKeys.spell1Id)
        self.spell2Id = try container.decode(Int.self, forKey: ParticipantCodingKeys.spell2Id)
        self.championId = try container.decode(Int.self, forKey: ParticipantCodingKeys.championId)
        self.stats = try container.decode(Stats.self, forKey: ParticipantCodingKeys.stats)
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
    var queueId: Int
    var participandIds: [ParticipantId]
    var participants: [Participant]
    var teams: [Team]
    
    enum MatchDetailCodingKeys: String, CodingKey{
        case participandIds = "participantIdentities"
        case duration = "gameDuration"
        case participants
        case teams
        case queueId
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: MatchDetailCodingKeys.self)
        self.participandIds = try container.decode([ParticipantId].self, forKey: MatchDetailCodingKeys.participandIds)
        self.duration = try container.decode(Int.self, forKey: MatchDetailCodingKeys.duration)
        self.participants = try container.decode([Participant].self, forKey: MatchDetailCodingKeys.participants)
        self.teams = try container.decode([Team].self, forKey: MatchDetailCodingKeys.teams)
        self.queueId = try container.decode(Int.self, forKey: .queueId)
    }
}
