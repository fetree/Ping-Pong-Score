//
//  ViewController.swift
//  Ping-Pong-Score
//
//  Created by David Eisenbaum on 10/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var game = PingPong(startingPlayers: [
        .init(playerColor: .orange),
        .init(playerColor: .systemMint)
    ])
    
    lazy var leftScoreView = TappableScoreView(
        player: game.players.first!,
        increment: game.increments.first!,
        onPress: leftPressed
    )
    
    lazy var rightScoreView = TappableScoreView(
        player: game.players.last!,
        increment: game.increments.first!,
        onPress: rightPressed
    )
    
    var resetButton: UIButton = {
        var button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        button.layer.shadowOffset = .init(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 1
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        game.gameDelegate = self
        setUpScoreViews()
        setupWithGame()
    }
    
    private func setUpScoreViews() {
        view.addSubview(leftScoreView)
        leftScoreView.translatesAutoresizingMaskIntoConstraints = false
        leftScoreView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftScoreView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        leftScoreView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        leftScoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        leftScoreView.servingLabel.isHidden = false
        
        view.addSubview(rightScoreView)
        rightScoreView.translatesAutoresizingMaskIntoConstraints = false
        rightScoreView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rightScoreView.leadingAnchor.constraint(equalTo: leftScoreView.trailingAnchor).isActive = true
        rightScoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        rightScoreView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        rightScoreView.servingLabel.isHidden = true
        
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.topAnchor.constraint(equalTo: rightScoreView.topAnchor, constant: 30).isActive = true
        resetButton.rightAnchor.constraint(equalTo: rightScoreView.rightAnchor, constant: -20).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        resetButton.addTarget(self, action: #selector(self.resetScore), for: .touchUpInside)
        
    }

    @objc func resetScore() {
        game.reset()
        setupWithGame()
    }
    
    func setupWithGame() {
        game.startNewRound()
        leftScoreView.totalScore = 0
        rightScoreView.totalScore = 0
        
        let leftIsFirst = game.currentPlayer == leftScoreView.player
        leftScoreView.servingLabel.isHidden = !leftIsFirst
        rightScoreView.servingLabel.isHidden = leftIsFirst
    }
    
    func leftPressed() {
        leftScoreView.increment(game.increment)
        game.incrementTurn()
    }
    
    func rightPressed() {
        rightScoreView.increment(game.increment)
        game.incrementTurn()
    }

}

extension ViewController: GameDelegate {
    func gameCurrentPlayerChanged(to player: Player) {
        let firstIsServing = player == game.players.first!
        leftScoreView.servingLabel.isHidden = !firstIsServing
        rightScoreView.servingLabel.isHidden = firstIsServing
    }
    
    func gameRoundEnded(exitConditions: [ExitCondition]) {
        game.swapPlayers()
    }
}
