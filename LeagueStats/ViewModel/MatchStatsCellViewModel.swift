//
//  MatchStatsCellViewModel.swift
//  LeagueStats
//
//  Created by Junyu Lin on 5/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

struct MatchStatsCellViewModel{
    var champImg: String
    var champLevel: String
    var spell1, spell2: String
    var summonerName: String
    var kdaLabel: NSAttributedString
    var item1, item2, item3, item4, item5, item6, item7: String
    var minionsGoldLabel: String
    var dmgLabel: String
    var dmage: Damages
    
    init(_ model: MatchStatsCellModel){
        self.champImg = ClientAPI.shard.getChampNameById(model.participants.championId)
        self.champLevel = "\(model.participants.stats.champLevel)"
        self.spell1 = StatsViewCellModel.getSpellName(model.participants.spell1Id)
        self.spell2 = StatsViewCellModel.getSpellName(model.participants.spell2Id)
        self.summonerName = model.participantIds.player.name
        self.kdaLabel = "\(model.participants.stats.kills) / \(model.participants.stats.deaths) / \(model.participants.stats.assists)".setColor(["\(model.participants.stats.deaths)"], .lossColor)
        self.item1 = "\(model.participants.stats.item0)"
        self.item2 = "\(model.participants.stats.item1)"
        self.item3 = "\(model.participants.stats.item2)"
        self.item4 = "\(model.participants.stats.item3)"
        self.item5 = "\(model.participants.stats.item4)"
        self.item6 = "\(model.participants.stats.item5)"
        self.item7 = "\(model.participants.stats.item6)"
        self.minionsGoldLabel = "\(model.participants.stats.totalMinionsKilled + model.participants.stats.neutralMinionsKilled)(\(String(format: "%.1f", Double((model.participants.stats.totalMinionsKilled + model.participants.stats.neutralMinionsKilled) / model.time)))) /  \(String(format: "%.1f", Double(model.participants.stats.goldEarned / 1000)))k"
        self.dmgLabel = "\(model.participants.stats.totalDamageDealtToChampions)"
        self.dmage = Damages(dmageDealt: model.participants.stats.totalDamageDealtToChampions, maxDamage: model.maxDamage)
    }
}
