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
    
    let diamondView: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.contentMode = .scaleAspectFit
        diamondImage.image = UIImage(named: "diamond")
        return diamondImage
    }()
    
    let firstBaseView: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.contentMode = .scaleAspectFit
        diamondImage.image = UIImage(named: "firstBase")
        return diamondImage
    }()
    
    let secondBaseView: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.contentMode = .scaleAspectFit
        diamondImage.image = UIImage(named: "secondBase")
        return diamondImage
    }()
    
    let thirdBaseView: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.contentMode = .scaleAspectFit
        diamondImage.image = UIImage(named: "thirdBase")
        return diamondImage
    }()

    var gameState = GameState.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "notTooBlack")
        setupScoreboard()
        setupStatBoard()
        setupButtons()
        setupDiamondImage()
    }
    
    func setupScoreboard() {
        
        self.view.addSubview(scoreBoard)
        scoreBoard.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        scoreBoard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        scoreBoard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        scoreBoard.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
        
    }
    
    func setupStatBoard() {
        self.view.addSubview(statBoard)
        statBoard.topAnchor.constraint(equalTo: scoreBoard.bottomAnchor, constant: 1.0).isActive = true
        statBoard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        statBoard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
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
    
    func setupDiamondImage() {
        self.view.addSubview(diamondView)
        
        NSLayoutConstraint.activate([
            diamondView.widthAnchor.constraint(equalTo: self.view.layoutMarginsGuide.widthAnchor, multiplier: 1.0),
            diamondView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            diamondView.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: 5)
        ])
        
    }
    
    func clearDiamondSubviews() {
        diamondView.subviews.forEach{ (item) in
            item.removeFromSuperview()
        }
    }
    
    func changeDiamondImage() {
        clearDiamondSubviews()
        
        if gameState.firstBase{
            diamondView.addSubview(firstBaseView)
            firstBaseView.trailingAnchor.constraint(equalTo: diamondView.trailingAnchor).isActive = true
            firstBaseView.centerYAnchor.constraint(equalTo: diamondView.centerYAnchor, constant: -5.0).isActive = true
        }
        if gameState.secondBase{
            diamondView.addSubview(secondBaseView)
            secondBaseView.centerXAnchor.constraint(equalTo: diamondView.centerXAnchor).isActive = true
        }
        if gameState.thirdBase{
            diamondView.addSubview(thirdBaseView)
            thirdBaseView.centerYAnchor.constraint(equalTo: diamondView.centerYAnchor, constant: -4.0).isActive = true
        }
        
    }
    
    func updateBoards() {
        statBoard.ballNumber.text = String(gameState.balls)
        statBoard.outsNumber.text = String(gameState.outs)
        statBoard.strikesNumber.text = String(gameState.strikes)
        
        scoreBoard.awayScore.text = String(gameState.awayScore)
        scoreBoard.homeScore.text = String(gameState.homeScore)
        print("First Base:\(gameState.firstBase) Second Base: \(gameState.secondBase) Third Base: \(gameState.thirdBase)")
    }
    

    func updateInnings() {
        gameState.inning += 1
        gameState.clearBases()
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
            statBoard.inningLabel.text = "Bottom \(placeHolder)\(stTH)"
            scoreBoard.homeScore.textColor = UIColor(named: "orangeRed")
            scoreBoard.awayScore.textColor = UIColor(named: "offWhite")
        } else {
            statBoard.inningLabel.text = "Top \(placeHolder)\(stTH)"
            scoreBoard.awayScore.textColor = UIColor(named: "orangeRed")
            scoreBoard.homeScore.textColor = UIColor(named: "offWhite")
        }
        
        updateBoards()
        gameState.clearBases()
        clearDiamondSubviews()
        
        if gameState.inning > 19 {
            // Game over (we also need to check if the team won in the top of the 9th, ie more score when batting second)
        }
    }
    
    func runnerOut() {
        gameState.outs += 1
        gameState.resetAtBat()
        
        if gameState.outs == 3 {
            gameState.outs = 0
            gameState.clearBases()
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
    
    func manOnFirst(hit: Int) {
        // check if someone is on first
        if gameState.firstBase {
            let firstAlert = UIAlertController(title: "Man on First", message: "Where'd they end up", preferredStyle: .alert)
            
            firstAlert.addAction(UIAlertAction(title: "Still on First", style: .default, handler:nil))
            
            firstAlert.addAction(UIAlertAction(title: "To Second!", style: .default, handler: { action in
                // print("Setting firstbase to false because To Second was pressed")
                self.gameState.firstBase = false
                self.gameState.secondBase = true
                self.gameState.setBatter(hit: hit)
                self.changeDiamondImage()
            }))
            
            firstAlert.addAction(UIAlertAction(title: "To Third!", style: .default, handler: { action in
                // print("Setting firstbase to false because To Third was pressed")
                self.gameState.firstBase = false
                self.gameState.thirdBase = true
                self.gameState.setBatter(hit: hit)
                self.changeDiamondImage()
            }))
            
            firstAlert.addAction(UIAlertAction(title: "To Home!", style: .default, handler: { action in
                // print("Setting firstbase to false because To Home was pressed")
                self.gameState.firstBase = false
                self.updateScore()
                self.gameState.setBatter(hit: hit)
                self.changeDiamondImage()
            }))
            
            firstAlert.addAction(UIAlertAction(title: "They're Out!", style: .destructive, handler: { action in
                // print("Seting first base to false because theyre out was pressed")
                self.gameState.firstBase = false
                self.runnerOut()
                self.gameState.setBatter(hit: hit)
                self.changeDiamondImage()
            }))
            self.present(firstAlert, animated: false, completion: nil)
        } else {
            self.gameState.setBatter(hit: hit)
            self.changeDiamondImage()
        }
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
                self.runnerOut()
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
            
            thirdAlert.addAction(UIAlertAction(title: "They're out", style: .destructive, handler: { action in
                self.gameState.thirdBase = false
                self.runnerOut()
                self.manOnSecond(hit: hit)
            }))
            self.present(thirdAlert, animated: false, completion: nil)
        } else{manOnSecond(hit: hit)}
    }
    
    // BUTTON THINGS
    @objc func ballAction() {
        gameState.balls += 1
        if gameState.balls == 4 {
            gameState.resetAtBat()
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
            changeDiamondImage()
        }
        updateBoards()
    }
    
    @objc func strikeAction() {
        gameState.strikes += 1
        if gameState.strikes == 3 {
            runnerOut()
            gameState.resetAtBat()
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
        runnerOut()
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
        gameState.resetAtBat()
        updateBoards()
    }

}
