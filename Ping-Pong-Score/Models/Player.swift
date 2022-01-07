//
//  Player.swift
//  Ping-Pong-Score
//
//  Created by Matthew Canoy on 1/4/22.
//

import Foundation
import UIKit

struct Player: Hashable {
    let id: String
    var name: String
    var elos: [String: Int]
    
    // TODO: convert this later to string and you hex conversion
    let playerColor: UIColor
    
    init(playerColor: UIColor) {
        self.playerColor = playerColor
        self.id = UUID().uuidString
        self.elos = [:]
        self.name = ""
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
