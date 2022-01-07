//
//  Game.swift
//  Ping-Pong-Score
//
//  Created by Matthew Canoy on 1/4/22.
//

import Foundation

struct Increment {
    let value: Int
    let title: String
}

struct Round {
    var title: String = ""
    var currentTurnCount: Int = 0
    var startDate: Date?
    var endDate: Date?
    var timeInSeconds: Int = 0
}

struct Rule {
    
}


enum ExitCondition {
    case time(seconds: Int)
    case turns(count: Int)
    case scoreGap(space: Int)
}

protocol GameDelegate: NSObject {
    func gameRoundEnded(exitConditions: [ExitCondition])
    func gameCurrentPlayerChanged(to player: Player)
}

protocol Game {
    var maxPlayersCount: Int { get set }
    var increments: [Increment] { get set }
    var rounds: [Round] { get set }
    var gameDelegate: GameDelegate? { get set }
    
    mutating func reset()
    mutating func startNewRound()
    mutating func incrementTurn()
}
