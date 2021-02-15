//
//  ScoreboardView.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/14/21.
//

import UIKit

class ScoreboardView: UIView {
    
    let scoreboardStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    let homeLabel : UILabel = {
        let homeLabel = UILabel()
        homeLabel.textColor = .darkGray
        homeLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
        homeLabel.text = "HOME"
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        return homeLabel
    }()
    
    let homeScore : UILabel = {
        let homeScore = UILabel()
        homeScore.textColor = .darkGray
        homeScore.font = UIFont(name: "Helvetica-Bold", size: 40)
        homeScore.text = "0"
        homeScore.translatesAutoresizingMaskIntoConstraints = false
        return homeScore
    }()
    
    let awayScore : UILabel = {
        let awayScore = UILabel()
        awayScore.textColor = .darkGray
        awayScore.font = UIFont(name: "Helvetica-Bold", size: 40)
        awayScore.text = "0"
        awayScore.translatesAutoresizingMaskIntoConstraints = false
        return awayScore
    }()
    
    let awayLabel : UILabel = {
        let awayLabel = UILabel()
        awayLabel.textColor = .darkGray
        awayLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
        awayLabel.text = "AWAY"
        awayLabel.translatesAutoresizingMaskIntoConstraints = false
        return awayLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        
        self.addSubview(scoreboardStack)
        scoreboardStack.addArrangedSubview(homeLabel)
        scoreboardStack.addArrangedSubview(homeScore)
        scoreboardStack.addArrangedSubview(awayScore)
        scoreboardStack.addArrangedSubview(awayLabel)
    }
    
}
