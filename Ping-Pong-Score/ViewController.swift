//
//  ViewController.swift
//  Ping-Pong-Score
//
//  Created by David Eisenbaum on 10/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    let leftScoreView = TappableScoreView(color: .red)
    let rightScoreView = TappableScoreView(color: .green)
    
    var resetButton: UIButton = {
        var button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScoreViews()
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
        leftScoreView.scoreLabel.text = String(0)
        rightScoreView.scoreLabel.text = String(0)
        TappableScoreView.totalScore = 0
        
        leftScoreView.servingLabel.isHidden = false
        
        rightScoreView.servingLabel.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if TappableScoreView.totalScore % 5 == 0 && TappableScoreView.totalScore != 0{
            let leftBool = leftScoreView.servingLabel.isHidden
            leftScoreView.servingLabel.isHidden = !leftBool
            
            let rightBool = rightScoreView.servingLabel.isHidden
            rightScoreView.servingLabel.isHidden = !rightBool
        }
    }

}

