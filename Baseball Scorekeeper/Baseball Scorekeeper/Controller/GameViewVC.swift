//
//  GameViewVC.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/14/21.
//

import UIKit

class GameViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupScoreboard()
        // Do any additional setup after loading the view.
    }
    
    func setupScoreboard(){
        
//        let scoreboardStack: UIStackView = {
//            let stackView = UIStackView()
//            stackView.axis = .horizontal
//            stackView.spacing = 20
//            stackView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.distribution = .equalCentering
//            stackView.backgroundColor = .white
//            return stackView
//        }()
//
//        let homeLabel : UILabel = {
//            let homeLabel = UILabel()
//            homeLabel.textColor = .darkGray
//            homeLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
//            homeLabel.text = "HOME"
//            homeLabel.translatesAutoresizingMaskIntoConstraints = false
//            return homeLabel
//        }()
//
//        let homeScore : UILabel = {
//            let homeScore = UILabel()
//            homeScore.textColor = .darkGray
//            homeScore.font = UIFont(name: "Helvetica-Bold", size: 40)
//            homeScore.text = "0"
//            homeScore.translatesAutoresizingMaskIntoConstraints = false
//            return homeScore
//        }()
//
//        let awayScore : UILabel = {
//            let awayScore = UILabel()
//            awayScore.textColor = .darkGray
//            awayScore.font = UIFont(name: "Helvetica-Bold", size: 40)
//            awayScore.text = "0"
//            awayScore.translatesAutoresizingMaskIntoConstraints = false
//            return awayScore
//        }()
//
//        let awayLabel : UILabel = {
//            let awayLabel = UILabel()
//            awayLabel.textColor = .darkGray
//            awayLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
//            awayLabel.text = "AWAY"
//            awayLabel.translatesAutoresizingMaskIntoConstraints = false
//            return awayLabel
//        }()
//
//        scoreboardStack.addArrangedSubview(homeLabel)
//        scoreboardStack.addArrangedSubview(homeScore)
//        scoreboardStack.addArrangedSubview(awayScore)
//        scoreboardStack.addArrangedSubview(awayLabel)
//        self.view.addSubview(scoreboardStack)
//        scoreboardStack.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        scoreboardStack.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
//        scoreboardStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        scoreboardStack.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        let scoreBoard = ScoreboardView()
        self.view.addSubview(scoreBoard)
        scoreBoard.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scoreBoard.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        scoreBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scoreBoard.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
    }
    

}
