//
//  GameState.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/15/21.
//

import Foundation

class GameState {
    static let shared = GameState()
    
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

    func clearBases() {
        self.firstBase = false
        self.secondBase = false
        self.thirdBase = false
    }
    
    func resetAtBat() {
        self.balls = 0
        self.strikes = 0
    }
}
