//
//  MatchTitleCellViewModel.swift
//  LeagueStats
//
//  Created by Junyu Lin on 5/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

struct MatchTitleCellViewModel{
    var backgroundColor: UIColor
    var winState: NSAttributedString
    var dragonImg, baronImg, towerImg: UIImage
    var dragonKills, baronKills, towerKills: String
    var teamStats: NSAttributedString
    
    init(_ model: MatchTitleCellModel){
        // set up title win, images
        if model.win == "L"{
            self.backgroundColor = .lossTitleColor
            self.winState = "Loss (Red)".setColor(["(Red)"], .gray)
            self.dragonImg = UIImage(named: "dragon-red")!
            self.baronImg = UIImage(named: "baron-red")!
            self.towerImg = UIImage(named: "tower-red")!
        }else{
            self.backgroundColor = .winTitleColor
            self.winState = "Win (Blue)".setColor(["(Blue)"], .gray)
            self.dragonImg = UIImage(named: "dragon-blue")!
            self.baronImg = UIImage(named: "baron-blue")!
            self.towerImg = UIImage(named: "tower-blue")!
        }
        
        // set the baron, dragon and tower kills
        if model.win == "W"{
            if model.teams[0].win == "Fail"{
                self.dragonKills = "\(model.teams[1].baronKills)"
                self.baronKills = "\(model.teams[1].dragonKills)"
                self.towerKills = "\(model.teams[1].towerKills)"
            }else{
                self.dragonKills = "\(model.teams[0].baronKills)"
                self.baronKills = "\(model.teams[0].dragonKills)"
                self.towerKills = "\(model.teams[0].towerKills)"
            }
        }else{
            if model.teams[0].win == "Fail"{
                self.dragonKills = "\(model.teams[0].baronKills)"
                self.baronKills = "\(model.teams[0].dragonKills)"
                self.towerKills = "\(model.teams[0].towerKills)"
            }else{
                self.dragonKills = "\(model.teams[1].baronKills)"
                self.baronKills = "\(model.teams[1].dragonKills)"
                self.towerKills = "\(model.teams[1].towerKills)"
            }
        }
        
        // set the total kills, deaths and assists of each team
        var kills: Int = 0, deaths: Int = 0, assists: Int = 0
        if model.win == "W"{
            if model.participants[0].stats.win{
                for i in 0..<5{
                    kills += model.participants[i].stats.kills
                    deaths += model.participants[i].stats.deaths
                    assists += model.participants[i].stats.assists
                }
            }else{
                for i in 5..<10{
                    kills += model.participants[i].stats.kills
                    deaths += model.participants[i].stats.deaths
                    assists += model.participants[i].stats.assists
                }
            }
            self.teamStats = "\(kills) / \(deaths) / \(assists)".setColor(["\(deaths)"], .lossColor)
        }else{
            if model.participants[0].stats.win{
                for i in 5..<10{
                    kills += model.participants[i].stats.kills
                    deaths += model.participants[i].stats.deaths
                    assists += model.participants[i].stats.assists
                }
            }else{
                for i in 0..<5{
                    kills += model.participants[i].stats.kills
                    deaths += model.participants[i].stats.deaths
                    assists += model.participants[i].stats.assists
                }
            }
            self.teamStats = "\(kills) / \(deaths) / \(assists)".setColor(["\(deaths)"], .lossColor)
        }
    }
}
