//
//  ScoreboardView.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/14/21.
//

import UIKit

class ScoreboardView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    let homeLabel : UILabel = {
        let homeLabel = UILabel()
        homeLabel.text = "HOME"
//        homeLabel.font =
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        return homeLabel
    }()
    
    let homeScore : UILabel = {
        let homeScore = UILabel()
        homeScore.text = "0"
        homeScore.translatesAutoresizingMaskIntoConstraints = false
        return homeScore
    }()
    
    let awayLabel : UILabel = {
        let awayLabel = UILabel()
        awayLabel.text = "AWAY"
        awayLabel.translatesAutoresizingMaskIntoConstraints = false
        return awayLabel
    }()
    
    let awayScore : UILabel = {
        let awayScore = UILabel()
        awayScore.text = "0"
        awayScore.translatesAutoresizingMaskIntoConstraints = false
        return awayScore
    }()
}
