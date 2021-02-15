//
//  Player.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/15/21.
//

import Foundation

enum FieldingPosition: String {
    case pitcher = "Pitcher"
    case catcher = "Catcher"
    case firstBase = "First Baseman"
    case secondBase = "Second Baseman"
    case thirdBase = "Third Baseman"    // idk
    case shortstop = "Shortstop"
    case leftFielder = "Left Fielder"
    case centerFielder = "Center Fielder"
    case rightFielder = "Right Fielder"
}

class Player {
    var firstName: String
    var lastName: String
    var team: String
    var position: FieldingPosition
    
    // Batting Statistics
    var atBats: Int = 0
    var hits: Int = 0
    var strikeOuts: Int = 0
    var stolenBases: Int = 0
    var caughtStealing: Int = 0
    var runs: Int = 0
    var runsBattedIn = 0
    var homeRuns: Int = 0
    
    // Fielding Statistics
    var putOuts: Int = 0
    var assists: Int = 0
    var errors: Int = 0
    
    init(firstName: String, lastName: String, team: String, position: FieldingPosition) {
        self.firstName = firstName
        self.lastName = lastName
        self.team = team
        self.position = position
    }

}
