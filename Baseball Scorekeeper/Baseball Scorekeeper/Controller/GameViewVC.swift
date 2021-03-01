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
    
    func clearBases() {
        gameState.firstBase = false
        gameState.secondBase = false
        gameState.thirdBase = false
    }
    
    func updateInnings() {
        gameState.inning += 1
        clearBases()
        print("Current inning: \(gameState.inning)")
        
        // We need to update what inning is happening, perhaps in updateBoards()?
        // Set the current teams at bat score to red color? to indicate?
        
        updateBoards()
        
        if gameState.inning > 19 {
            // Game over (we also need to check if the team won in the top of the 9th, ie more score when batting second)
        }
    }
    
    func yerOut() {
        gameState.outs += 1
        
        if gameState.outs == 3 {
            gameState.outs = 0
            updateInnings()
            // Switch sides
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
    
    func onBase() {
        // OK So this has a bug. If you have someone on two bases, it will try to present both UIAlertControllers and give the following error:
        // Scorekeeper[13072:13323548] [Presentation] Attempt to present <UIAlertController: 0x7ff05680cc00> on <Baseball_Scorekeeper.TabBarVC: 0x7ff05800fc00> (from <Baseball_Scorekeeper.GameViewVC: 0x7ff057209860>) which is already presenting <UIAlertController: 0x7ff055853600>.
        
        // I tried to chase it down with self.dismiss but that just instantly dismisses the controller. I also tried to change the logic around in how and when its called and yeah idk. If you can find a way to dismiss the alert between each one but still waiting for the option from the user, that would fix the bug
        
        if self.gameState.thirdBase {
            self.manOnThird()
        }
        
        if self.gameState.secondBase {
            self.manOnSecond()
        }
        
        if self.gameState.firstBase {
            self.manOnFirst()
        }
    }
    
    func manOnFirst() {
        let firstAlert = UIAlertController(title: "Man on First", message: "Where'd they end up", preferredStyle: .alert)
        
        firstAlert.addAction(UIAlertAction(title: "Still on First", style: .default, handler:nil))
        
        firstAlert.addAction(UIAlertAction(title: "To Second!", style: .default, handler: { action in
            self.gameState.firstBase = false
            self.gameState.secondBase = true
        }))
        
        firstAlert.addAction(UIAlertAction(title: "To Third!", style: .default, handler: { action in
            self.gameState.firstBase = false
            self.gameState.thirdBase = true
        }))
        
        firstAlert.addAction(UIAlertAction(title: "To Home!", style: .default, handler: { action in
            self.gameState.firstBase = false
            self.updateScore()
        }))
        
        firstAlert.addAction(UIAlertAction(title: "They're Out!", style: .destructive, handler: { action in
            self.gameState.firstBase = false
            self.yerOut()
        }))
        
        self.present(firstAlert, animated: false, completion: nil)
    }
    
    func manOnSecond() {
        let secondAlert = UIAlertController(title: "Man on Second", message: "Where'd they end up?", preferredStyle: .alert)
        secondAlert.addAction(UIAlertAction(title: "Still on second", style: .default, handler: nil))
        secondAlert.addAction(UIAlertAction(title: "To Third!", style: .default, handler: {action in
            self.gameState.secondBase = false
            self.gameState.thirdBase = true
        }))
        secondAlert.addAction(UIAlertAction(title: "To Home!", style: .default, handler: {action in
            self.gameState.secondBase = false
            self.updateScore()
        }))
        secondAlert.addAction(UIAlertAction(title: "They're out!", style: .destructive, handler: {action in
            self.gameState.secondBase = false
            self.yerOut()
        }))
        
        self.present(secondAlert, animated: false, completion: nil)
    }
    
    func manOnThird() {
        let thirdAlert = UIAlertController(title: "Man On Third", message: "Did they make it Home?", preferredStyle: .alert)
        thirdAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.updateScore()
            self.gameState.thirdBase = false
        }))
        thirdAlert.addAction(UIAlertAction(title: "Nope", style: .default, handler: nil))
        
        thirdAlert.addAction(UIAlertAction(title: "They're out", style: .default, handler: { action in
            self.gameState.thirdBase = false
            self.yerOut()
        }))
        self.present(thirdAlert, animated: false, completion: nil)
        
        
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
            resetAtBat()
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
            self.onBase()
            self.gameState.firstBase = true
        }))
        alert.addAction(UIAlertAction(title: "Double", style: .default, handler: { action in
            print("DOUBLE")
            self.onBase()
            self.gameState.secondBase = true
        }))
        alert.addAction(UIAlertAction(title: "Triple", style: .default, handler: { action in
            print("TRIPLE")
            self.onBase()
            self.gameState.thirdBase = true
            
        }))
        alert.addAction(UIAlertAction(title: "Homerun!", style: .default, handler: { action in
            print("HOMERUN")
            self.onBase()
            self.updateScore()
        }))
        self.present(alert, animated: false, completion: nil)
        resetAtBat()
    }

}
