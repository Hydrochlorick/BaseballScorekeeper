//
//  GameState.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/15/21.
//

import Foundation

enum Inning: String {
    case topFirst = "Fuck this is gonna be tedious"
    case bottomFirst = "Also gotta decide"
    case topSecond
    case bottomwSecond
    case topThird
    case bottomThird
    case topFourth
    case bottomFourth
}

struct GameState {
    var inning: Int
}