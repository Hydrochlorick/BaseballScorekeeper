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
        let scoreBoard = ScoreboardView()
        self.view.addSubview(scoreBoard)
        scoreBoard.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scoreBoard.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        scoreBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    

}
