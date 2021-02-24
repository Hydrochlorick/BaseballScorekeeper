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
        
        // TODO: Change the color once everything's all set
        view.backgroundColor = .red
        setupScoreboard()
    }
    
    func setupScoreboard(){
        
        let scoreBoard = ScoreboardView()
        self.view.addSubview(scoreBoard)
        scoreBoard.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        scoreBoard.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        scoreBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scoreBoard.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
    }
    

}
