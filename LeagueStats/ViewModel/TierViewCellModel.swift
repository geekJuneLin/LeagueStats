//
//  TierViewCellModel.swift
//  LeagueStats
//
//  Created by Junyu Lin on 3/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

struct TierViewCellModel{
    var image: UIImage
    var type: String
    var tier: String
    var point: String
    var winRate: String
    
    init(_ tierModel: TierModel){
        self.image = tierModel.tier.tierImg
        self.type = tierModel.type
        self.tier = tierModel.tier.tier
        self.point = "\(tierModel.tier.point) LP"
        self.winRate = TierViewCellModel.getWinRate(tierModel.tier.win, tierModel.tier.loss)
    }
}

extension TierViewCellModel{
    fileprivate static func getWinRate(_ win: Int, _ lose: Int) -> String{
        if lose == 0 && win == 0{
            return "\(win)W \(lose)L (-)"
        }else if lose == 0 && win != 0{
            return "\(win)W \(lose)L (100%)"
        }else{
            let rate = Double(win) / (Double(win) + Double(lose)) * 100
            return "\(win)W \(lose)L (\(String(format: "%.2f", rate))%)"
        }
    }
}
