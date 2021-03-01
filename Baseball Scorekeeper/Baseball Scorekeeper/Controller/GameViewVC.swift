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
    
    let diamondBanana: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.contentMode = .scaleAspectFit
        diamondImage.image = UIImage(named: "")
        return diamondImage
    }()
    
    let firstBaseBanana: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.contentMode = .scaleAspectFit
        diamondImage.image = UIImage(named: "")
        return diamondImage
    }()
    
    let secondBaseBanana: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.contentMode = .scaleAspectFit
        diamondImage.image = UIImage(named: "")
        return diamondImage
    }()
    
    let thirdBaseBanana: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.contentMode = .scaleAspectFit
        diamondImage.image = UIImage(named: "")
        return diamondImage
    }()

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
        statBoard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        statBoard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
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
        
        var placeHolder = (gameState.inning / 2)
        if gameState.inning % 2 == 0 {
            print("\(placeHolder)")
        } else {
            placeHolder += 1
            print("\(placeHolder)")
        }
        
        var stTH = "st"
        
        if placeHolder == 1 {
            stTH = "st"
        } else if placeHolder == 2 {
            stTH = "nd"
        } else if placeHolder == 3 {
            stTH = "rd"
        } else {
            stTH = "th"
        }
        
        if gameState.inning % 2 == 0 {
            statBoard.inningLabel.text = "Bottom of the \(placeHolder)\(stTH)"
        } else {
            statBoard.inningLabel.text = "Top of the \(placeHolder)\(stTH)"
        }
        
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
    
    func setBatter(hit: Int) {
        if hit == 1 {
            gameState.firstBase = true
        } else if hit == 2 {
            gameState.secondBase = true
        } else if hit == 3 {
            gameState.thirdBase = true
        } else {}
    }
    
    
    func manOnFirst(hit: Int) {
        // check if someone is on first
        if gameState.firstBase {
            let firstAlert = UIAlertController(title: "Man on First", message: "Where'd they end up", preferredStyle: .alert)
            
            firstAlert.addAction(UIAlertAction(title: "Still on First", style: .default, handler:nil))
            
            firstAlert.addAction(UIAlertAction(title: "To Second!", style: .default, handler: { action in
                // print("Setting firstbase to false because To Second was pressed")
                self.gameState.firstBase = false
                self.gameState.secondBase = true
                self.setBatter(hit: hit)
            }))
            
            firstAlert.addAction(UIAlertAction(title: "To Third!", style: .default, handler: { action in
                // print("Setting firstbase to false because To Third was pressed")
                self.gameState.firstBase = false
                self.gameState.thirdBase = true
                self.setBatter(hit: hit)
            }))
            
            firstAlert.addAction(UIAlertAction(title: "To Home!", style: .default, handler: { action in
                // print("Setting firstbase to false because To Home was pressed")
                self.gameState.firstBase = false
                self.updateScore()
                self.setBatter(hit: hit)
            }))
            
            firstAlert.addAction(UIAlertAction(title: "They're Out!", style: .destructive, handler: { action in
                // print("Seting first base to false because theyre out was pressed")
                self.gameState.firstBase = false
                self.yerOut()
                self.setBatter(hit: hit)
            }))
            self.present(firstAlert, animated: false, completion: nil)
        } else {self.setBatter(hit: hit)}
    }
    
    func manOnSecond(hit: Int) {
        // check if someone is on second first
        if gameState.secondBase {
            let secondAlert = UIAlertController(title: "Man on Second", message: "Where'd they end up?", preferredStyle: .alert)
            secondAlert.addAction(UIAlertAction(title: "Still on second", style: .default, handler: { action in
                self.manOnFirst(hit: hit)
            }))
            secondAlert.addAction(UIAlertAction(title: "To Third!", style: .default, handler: {action in
                self.gameState.secondBase = false
                self.gameState.thirdBase = true
                self.manOnFirst(hit: hit)
            }))
            secondAlert.addAction(UIAlertAction(title: "To Home!", style: .default, handler: {action in
                self.gameState.secondBase = false
                self.updateScore()
                self.manOnFirst(hit: hit)
            }))
            secondAlert.addAction(UIAlertAction(title: "They're out!", style: .destructive, handler: {action in
                self.gameState.secondBase = false
                self.yerOut()
                self.manOnFirst(hit: hit)
            }))
            
            self.present(secondAlert, animated: false, completion: nil)
        }else{manOnFirst(hit: hit)}
    }
    
    func manOnThird(hit: Int) {
        // check if someone is on third first
        if gameState.thirdBase {
            let thirdAlert = UIAlertController(title: "Man On Third", message: "Did they make it Home?", preferredStyle: .alert)
            thirdAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.updateScore()
                self.gameState.thirdBase = false
                self.manOnSecond(hit: hit)
            }))
            thirdAlert.addAction(UIAlertAction(title: "Nope", style: .default, handler: { action in
                self.manOnSecond(hit: hit)
            }))
            
            thirdAlert.addAction(UIAlertAction(title: "They're out", style: .default, handler: { action in
                self.gameState.thirdBase = false
                self.yerOut()
                self.manOnSecond(hit: hit)
            }))
            self.present(thirdAlert, animated: false, completion: nil)
        } else{manOnSecond(hit: hit)}
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
            self.manOnThird(hit: 1)
        }))
        alert.addAction(UIAlertAction(title: "Double", style: .default, handler: { action in
            print("DOUBLE")
            self.manOnThird(hit: 2)
        }))
        alert.addAction(UIAlertAction(title: "Triple", style: .default, handler: { action in
            print("TRIPLE")
            self.manOnThird(hit: 3)
            
        }))
        alert.addAction(UIAlertAction(title: "Homerun!", style: .default, handler: { action in
            print("HOMERUN")
            self.manOnThird(hit: 4)
            self.updateScore()
        }))
        self.present(alert, animated: false, completion: nil)
        resetAtBat()
    }

}
