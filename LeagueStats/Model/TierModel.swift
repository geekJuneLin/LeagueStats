//
//  TierModel.swift
//  LeagueStats
//
//  Created by Junyu Lin on 3/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

struct TierModel{
    var type: String
    var tier: TierInfo
}

struct TierInfo {
    var tier: String
    var tierImg: UIImage
    var point: Int
    var win: Int
    var loss: Int
}
