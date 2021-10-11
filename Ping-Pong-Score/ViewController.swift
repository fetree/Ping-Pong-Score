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
        
        view.addSubview(rightScoreView)
        rightScoreView.translatesAutoresizingMaskIntoConstraints = false
        rightScoreView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rightScoreView.leadingAnchor.constraint(equalTo: leftScoreView.trailingAnchor).isActive = true
        rightScoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        rightScoreView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
    }


}

