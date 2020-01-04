//
//  MatchStats.swift
//  LeagueStats
//
//  Created by Junyu Lin on 30/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import Foundation

struct MatchStats{
    var participantIDs: [ParticipantId]
    var participants: [Participant]
    var date: String
    var time: Int
    var teams: [Team]
}
