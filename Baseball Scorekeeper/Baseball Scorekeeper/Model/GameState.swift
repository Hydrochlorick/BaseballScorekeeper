//
//  GameState.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/15/21.
//

import Foundation

struct GameState {
    var inning: Int = 1
    var balls: Int = 0
    var strikes: Int = 0
    var outs: Int = 0
    var homeScore: Int = 0
    var awayScore: Int = 0
    
    var firstBase: Bool = false
    var secondBase: Bool = false
    var thirdBase: Bool = false
    
    var displayInning:Int = 1
    
    var homeatBat: Bool = false

}
