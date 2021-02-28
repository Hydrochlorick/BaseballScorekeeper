//
//  GameViewVC.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/14/21.
//

import UIKit

class GameViewVC: UIViewController {
    
    let scoreBoard = ScoreboardView()
    let statBoard = AtBatStatBoardView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Change the color once everything's all set
        view.backgroundColor = UIColor(named: "notTooBlack")
        setupScoreboard()
        setupStatBoard()
    }
    
    func setupScoreboard() {
        
        self.view.addSubview(scoreBoard)
        scoreBoard.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        scoreBoard.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        scoreBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scoreBoard.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
    }
    
    func setupStatBoard() {
        self.view.addSubview(statBoard)
        statBoard.topAnchor.constraint(equalTo: scoreBoard.bottomAnchor, constant: 1.0).isActive = true
        statBoard.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        statBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        statBoard.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

}
