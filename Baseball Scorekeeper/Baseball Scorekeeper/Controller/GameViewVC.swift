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
    let buttonStack = ButtonStackView()

    var gameState = GameState()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "notTooBlack")
        setupScoreboard()
        setupStatBoard()
        setupButtons()
    }
    
    func setupScoreboard() {
        
        self.view.addSubview(scoreBoard)
        scoreBoard.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        scoreBoard.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        scoreBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scoreBoard.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
        
    }
    
    func setupStatBoard() {
        self.view.addSubview(statBoard)
        statBoard.topAnchor.constraint(equalTo: scoreBoard.bottomAnchor, constant: 1.0).isActive = true
        statBoard.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        statBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        statBoard.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupButtons() {
        self.view.addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            buttonStack.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            buttonStack.heightAnchor.constraint(equalToConstant: 40),
            buttonStack.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonStack.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        buttonStack.ballButton.addTarget(self, action: #selector(ballAction), for: .touchUpInside)
        buttonStack.strikeButton.addTarget(self, action: #selector(strikeAction), for: .touchUpInside)
        buttonStack.foulButton.addTarget(self, action: #selector(foulAction), for: .touchUpInside)
        buttonStack.outButton.addTarget(self, action: #selector(outAction), for: .touchUpInside)
        buttonStack.hitButton.addTarget(self, action: #selector(hitAction), for: .touchUpInside)
    }
    
    func updateBoards() {
        statBoard.ballNumber.text = String(gameState.balls)
        statBoard.outsNumber.text = String(gameState.outs)
        statBoard.strikesNumber.text = String(gameState.strikes)
        
        scoreBoard.awayScore.text = String(gameState.awayScore)
        scoreBoard.homeScore.text = String(gameState.homeScore)
        print("First Base:\(gameState.firstBase) Second Base: \(gameState.secondBase) Third Base: \(gameState.thirdBase)")
    }
    
    func resetAtBat() {
        gameState.balls = 0
        gameState.strikes = 0
        updateBoards()
    }
    
    func yerOut() {
        resetAtBat()
        gameState.outs += 1
        
        if gameState.outs == 3 {
            gameState.outs = 0
            //somethin's gonna happen
            // Update innings
            // Switch sides
            // Clear bases
        }
        updateBoards()
    }
    
    func updateScore(score: Int = 1) {
        if gameState.inning % 2 == 0 {
            gameState.homeScore += score
            updateBoards()
        } else {
            gameState.awayScore += score
            updateBoards()
        }
    }
    
    // BUTTON THINGS
    @objc func ballAction() {
        gameState.balls += 1
        if gameState.balls == 4 {
            resetAtBat()
            if gameState.firstBase {
                if gameState.secondBase {
                    if gameState.thirdBase {
                        updateScore()
                    }
                    gameState.thirdBase = true
                }
                gameState.secondBase = true
            }
            gameState.firstBase = true
            // update player at bat
        }
        updateBoards()
    }
    
    @objc func strikeAction() {
        gameState.strikes += 1
        if gameState.strikes == 3 {
            yerOut()
        }
        updateBoards()
    }
    
    @objc func foulAction() {
        if gameState.strikes == 2 {
            return
        }
        else {
            gameState.strikes += 1
            updateBoards()
        }
    }
    
    @objc func outAction() {
        yerOut()
    }
    
    @objc func hitAction() {
        let alert = UIAlertController(title: "Hit!", message: "Where did they end up?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Single", style: .default, handler: { action in
            print("SINGLE")
        }))
        alert.addAction(UIAlertAction(title: "Double", style: .default, handler: { action in
            print("DOUBLE")
        }))
        alert.addAction(UIAlertAction(title: "Triple", style: .default, handler: { action in
            print("TRIPLE")
        }))
        alert.addAction(UIAlertAction(title: "Homerun!", style: .default, handler: { action in
            print("HOMERUN")
        }))
        self.present(alert, animated: false, completion: nil)
        resetAtBat()
    }

}
