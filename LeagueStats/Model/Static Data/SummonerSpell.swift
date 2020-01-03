//
//  SummonerSpell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 1/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import Foundation

struct SummonerSpell {
    var id: Int
    var name: String
    static let spellMap: [SummonerSpell] = [SummonerSpell](arrayLiteral: SummonerSpell(id: 1, name: "SummonerBoost"),
                        SummonerSpell(id: 3, name: "SummonerExhaust"),
                        SummonerSpell(id: 4, name: "SummonerFlash"),
                        SummonerSpell(id: 6, name: "SummonerHaste"),
                        SummonerSpell(id: 7, name: "SummonerHeal"),
                        SummonerSpell(id: 11, name: "SummonerSmite"),
                        SummonerSpell(id: 12, name: "SummonerTeleport"),
                        SummonerSpell(id: 13, name: "SummonerMana"),
                        SummonerSpell(id: 14, name: "SummonerDot"),
                        SummonerSpell(id: 21, name: "SummonerBarrier"),
                        SummonerSpell(id: 30, name: "SummonerPoroRecall"),
                        SummonerSpell(id: 31, name: "SummonerPoroThrow"),
                        SummonerSpell(id: 32, name: "SummonerSnowball"),
                        SummonerSpell(id: 39, name: "SummonerSnowURFSnowball_Mark"))
}

//    case _21 = "SummonerBarrier"
//    case _1  = "SummonerBoost"
//    case _14 = "SummonerDot"
//    case _3  = "SummonerExhaust"
//    case _4  = "SummonerFlash"
//    case _6  = "SummonerHaste"
//    case _7  = "SummonerHeal"
//    case _13 = "SummonerMana"
//    case _30 = "SummonerPoroRecall"
//    case _31 = "SummonerPoroThrow"
//    case _11 = "SummonerSmite"
//    case _39 = "SummonerSnowURFSnowball_Mark"
//    case _32 = "SummonerSnowball"
//    case _12 = "SummonerTeleport"
