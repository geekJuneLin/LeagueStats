//
//  StatusModel.swift
//  LeagueStats
//
//  Created by Junyu Lin on 4/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import Foundation

struct StatusModel{
    var stats: Stats
    var time: String
    var totalKill: Int
    var spell1Id, spell2Id: Int
    var championName: String
    var queueId: Int
    var date: String
}
