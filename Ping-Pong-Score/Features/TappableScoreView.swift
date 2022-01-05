//
//  TappableScoreView.swift
//  Ping-Pong-Score
//
//  Created by David Eisenbaum on 10/10/21.
//

import UIKit


class TappableScoreView: UIView, Scoreboard {
    
    var scoreLabel = UILabel()
    var servingLabel = UILabel()
    var isServing: Bool!
    var totalScore: Int = 0 {
        didSet {
            scoreLabel.text = totalScore.description
        }
    }
    
    var increment: Increment
    
    var player: Player
    
    var onPress: () -> Void
    
    init(frame: CGRect = .zero, player: Player, increment: Increment, onPress: @escaping () -> Void) {
        self.onPress = onPress
        self.increment = increment
        self.player = player
        
        super.init(frame: frame)
        
        self.backgroundColor = player.playerColor
        
        scoreLabel.font = scoreLabel.font.withSize(40)
        scoreLabel.text = "0"
        scoreLabel.textColor = .white
        scoreLabel.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        scoreLabel.layer.shadowOffset = .init(width: 0, height: 2)
        scoreLabel.layer.shadowRadius = 4
        scoreLabel.layer.shadowOpacity = 1
        addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(servingLabel)
        servingLabel.text = "Serving"
        servingLabel.translatesAutoresizingMaskIntoConstraints = false
        servingLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor).isActive = true
        servingLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        servingLabel.textColor = .white
        servingLabel.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        servingLabel.layer.shadowOffset = .init(width: 0, height: 2)
        servingLabel.layer.shadowRadius = 4
        servingLabel.layer.shadowOpacity = 1
        // Make tappable
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.increaseScore))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func increaseScore(_ sender: UITapGestureRecognizer){
        onPress()
    }
    
    func increment(_ increment: Increment) {
        totalScore += increment.value
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
