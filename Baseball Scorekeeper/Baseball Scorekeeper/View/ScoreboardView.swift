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
        homeLabel.textColor = UIColor(named: "offWhite")
        homeLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
        homeLabel.text = "Home"
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        return homeLabel
    }()
    
    let homeScore : UILabel = {
        let homeScore = UILabel()
        homeScore.textColor = UIColor(named: "offWhite")
        homeScore.font = UIFont(name: "Helvetica-Bold", size: 40)
        homeScore.text = "0"
        homeScore.translatesAutoresizingMaskIntoConstraints = false
        return homeScore
    }()
    
    let awayScore : UILabel = {
        let awayScore = UILabel()
        awayScore.textColor = UIColor(named: "orangeRed")
        awayScore.font = UIFont(name: "Helvetica-Bold", size: 40)
        awayScore.text = "0"
        awayScore.translatesAutoresizingMaskIntoConstraints = false
        return awayScore
    }()
    
    let awayLabel : UILabel = {
        let awayLabel = UILabel()
        awayLabel.textColor = UIColor(named: "offWhite")
        awayLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
        awayLabel.text = "Away"
        awayLabel.translatesAutoresizingMaskIntoConstraints = false
        return awayLabel
    }()
    
    let dashLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "offWhite")
        label.font = UIFont(name: "Helvetica-Bold", size: 30)
        label.text = "-"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        self.backgroundColor = .clear
        
        self.addSubview(scoreboardStack)
        scoreboardStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scoreboardStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
        scoreboardStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scoreboardStack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
        
        
        scoreboardStack.addArrangedSubview(homeLabel)
        scoreboardStack.addArrangedSubview(homeScore)
//        scoreboardStack.addArrangedSubview(dashLabel)
        scoreboardStack.addArrangedSubview(awayScore)
        scoreboardStack.addArrangedSubview(awayLabel)
    }
    
}
