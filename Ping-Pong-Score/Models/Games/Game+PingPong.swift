//
//  Game+PingPong.swift
//  Ping-Pong-Score
//
//  Created by Matthew Canoy on 1/5/22.
//

import Foundation

class PingPong: Game {
    
    var maxPlayersCount: Int = 2 // for now
    
    var increments: [Increment] = [.init(value: 1, title: "")]
    
    // Ping pong only goes up by 1
    var increment: Increment { return increments.first! }
    
    var rounds: [Round] = []
    
    var latestRound: Round {
        return rounds.last!
    }
    
    var isSingles: Bool = true
    
    var players: [Player]
    
    var currentPlayer: Player! {
        didSet {
            gameDelegate?.gameCurrentPlayerChanged(to: currentPlayer)
        }
    }
    
    weak var gameDelegate: GameDelegate?
    
    // TODO: Write custom flow for determining different rounds and increment
    init(startingPlayers: [Player]) {
        players = startingPlayers
        currentPlayer = startingPlayers.first
    }
    
    func reset() {
        rounds.removeAll()
        
        swapPlayers()
    }
    
    func startNewRound() {
        if rounds.isEmpty {
            rounds = [.init()]
        } else {
            rounds.append(.init())
        }
    }
    
    func incrementTurn() {
        rounds[rounds.count-1].currentTurnCount += 1
        if latestRound.currentTurnCount == 2 {
            gameDelegate?.gameRoundEnded(exitConditions: [.turns(count: 2)])
            startNewRound()
        }
    }
    
    func swapPlayers() {
        let oppositePlayer = (currentPlayer == players.first) ? players.last : players.first
        currentPlayer = oppositePlayer
    }
}
