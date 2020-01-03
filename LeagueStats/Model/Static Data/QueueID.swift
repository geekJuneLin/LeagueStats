//
//  QueueID.swift
//  LeagueStats
//
//  Created by Junyu Lin on 2/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import Foundation

struct QueueID{
    func getGameType(_ id: Int) -> String{
        switch(id){
        case 0 : return "Custom"
        case 2 : return "Blind Pick"
        case 4 : return "Ranked Solo"
        case 6 : return "Ranked Premade"
        case 7 : return "Co-op vs AI"
        case 8 : return "3v3 Normal"
        case 9 : return "3v3 Ranked Flex"
        case 14 : return "5v5 Draft Pick"
        case 16 : return "5v5 Dominion Blind"
        case 17 : return "5v5 Dominion Draft"
        case 25 : return "Dominion Co-op"
        case 31 : return "Co-op Intro"
        case 32 : return "Co-op AI Beginner"
        case 33 : return "Co-op AI Intermediate"
        case 41 : return "3v3 Ranked Team"
        case 42 : return "5v5 Ranked Team"
        case 52 : return "Co-op vs AI"
        case 61 : return "5v5 Team Builder"
        case 65 : return "5v5 ARAM"
        case 67 : return "ARAM Co-op vs AI"
        case 76 : return "URF Game"
        case 100 : return "5v5 ARAM"
        case 400 : return "5v5 Draft Pick"
        case 410 : return "5v5 Ranked Dynamic"
        case 420 : return "5v5 Ranked Solo"
        case 430 : return "5v5 Blind Pick"
        case 440 : return "5v5 Ranked Flex"
        case 450 : return "5v5 ARAM"
        case 460 : return "3v3 Blind Pick"
        case 470 : return "3v3 Ranked Flex"
        case 900 : return "URF Game"
        default:
            return "Unknown Game Type"
        }
    }
}
