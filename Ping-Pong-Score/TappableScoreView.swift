//
//  TappableScoreView.swift
//  Ping-Pong-Score
//
//  Created by David Eisenbaum on 10/10/21.
//

import UIKit


class TappableScoreView: UIView, Scoreboard{
    
    var scoreLabel = UILabel()
    var servingLabel = UILabel()
    var isServing: Bool!
    static var totalScore: Int = 0
    
    init(frame: CGRect = .zero, color: UIColor) {
        super.init(frame: frame)
        
        self.backgroundColor = color
        
        scoreLabel.font = scoreLabel.font.withSize(40)
        scoreLabel.text = "0"
        addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(servingLabel)
        servingLabel.text = "Serving"
        servingLabel.translatesAutoresizingMaskIntoConstraints = false
        servingLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor).isActive = true
        servingLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // Make tappable
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.increaseScore))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func increaseScore(_ sender: UITapGestureRecognizer){
        guard let score = scoreLabel.text, var val = Int(score) else {
            return
        }
        val = val + 1
        TappableScoreView.totalScore += 1
        
        scoreLabel.text = String(val)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
