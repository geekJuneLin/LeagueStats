//
//  StatsViewCellModel.swift
//  LeagueStats
//
//  Created by Junyu Lin on 3/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

struct StatsViewCellModel{
    var win: String
    var statusBackgroundColor: UIColor
    var kda: NSAttributedString
    var kp: String
    var time: String
    var champName: String
    var spell1: String
    var spell2: String
    var images: [ItemImages]
    var gameType: String
    var gameDate: String
    
    init(_ statusModel: StatusModel){
        self.win = statusModel.stats.win ? "W" : "L"
        self.statusBackgroundColor = statusModel.stats.win ? .winColor : .lossColor
        self.kda = "\(statusModel.stats.kills) / \(statusModel.stats.deaths) / \(statusModel.stats.assists)".setColor(["\(statusModel.stats.deaths)"], .lossColor)
        self.kp = "K/P \(StatsViewCellModel.calculateKP(statusModel.stats.kills, statusModel.stats.assists, statusModel.totalKill))%"
        self.time = statusModel.time
        self.champName = statusModel.championName
        self.spell1 = StatsViewCellModel.getSpellName(statusModel.spell1Id)
        self.spell2 = StatsViewCellModel.getSpellName(statusModel.spell2Id)
        self.images = [ItemImages](arrayLiteral: ItemImages(id: statusModel.stats.item0),
                                              ItemImages(id: statusModel.stats.item1),
                                              ItemImages(id: statusModel.stats.item2),
                                              ItemImages(id: statusModel.stats.item3),
                                              ItemImages(id: statusModel.stats.item4),
                                              ItemImages(id: statusModel.stats.item5),
                                              ItemImages(id: statusModel.stats.item6))
        self.gameType = QueueID.getGameType(statusModel.queueId)
        self.gameDate = statusModel.date
    }
}

// MARK: - functions
extension StatsViewCellModel{
    /// calculate the KP value of the summoner
    /// - Parameters:
    ///   - kill: kills got
    ///   - assist: assist had
    ///   - totalKill: total kills of the team
    fileprivate static func calculateKP(_ kill: Int, _ assist: Int, _ totalKill: Int) -> String{
        let value = (Double(kill + assist) / Double(totalKill)) * 100
        let str = String(format: "%.0f", value)
        return str
    }
    
    /// get the spell name in terms of the spell id got from API
    /// - Parameter id: id of the spell
    public static func getSpellName(_ id: Int) -> String{
        var str = ""
        SummonerSpell.spellMap.forEach { (spell) in
            if spell.id == id{
                str = spell.name
                return
            }
        }
        return str
    }
}
