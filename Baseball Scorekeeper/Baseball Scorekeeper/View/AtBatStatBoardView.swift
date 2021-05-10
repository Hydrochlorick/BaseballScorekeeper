//
//  abStatBoardView.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/27/21.
//

import UIKit

class AtBatStatBoardView: UIView {

    // The parent Stack View
    let boardStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
//        stackView.backgroundColor = UIColor(named: "orangeRed")
        return stackView
    }()
    
    // Idk how we're gonna do this one
    let inningLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "offWhite")
        label.text = "Top of the 1st"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Balls. StackView. Two little labels
    let ballsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
//        stackView.distribution = .equalSpacing
//        stackView.backgroundColor = .blue
        return stackView
    }()
    let bLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "offWhite")
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.text = "B"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    let ballNumber : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "offWhite")
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    
    // Strikes StackView. Same thing. This is only a little silly.
    let strikeStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
//        stackView.distribution = .equalSpacing
//        stackView.backgroundColor = .red
        return stackView
    }()
    let sLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "offWhite")
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.text = "S"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    let strikesNumber : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "offWhite")
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    // Outs StackView
    let outStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
//        stackView.distribution = .equalSpacing
//        stackView.backgroundColor = .brown
        return stackView
    }()
    let oLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "offWhite")
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.text = "O"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    let outsNumber : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "offWhite")
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
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
        
        self.addSubview(boardStack)
        boardStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        boardStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
        boardStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        boardStack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
        
        
        
        // TODO: Figure out how to space stuff right on the AtBatStackBoard
        boardStack.addArrangedSubview(inningLabel)
        inningLabel.widthAnchor.constraint(equalTo: boardStack.widthAnchor, multiplier: 0.4).isActive = true
        
        boardStack.addArrangedSubview(ballsStack)
//        ballsStack.widthAnchor.constraint(equalTo: boardStack.widthAnchor, multiplier: 0.22).isActive = true
        ballsStack.addArrangedSubview(bLabel)
        ballsStack.addArrangedSubview(ballNumber)
        
        boardStack.addArrangedSubview(strikeStack)
//        strikeStack.widthAnchor.constraint(equalTo: boardStack.widthAnchor, multiplier: 0.22).isActive = true
        strikeStack.addArrangedSubview(sLabel)
        strikeStack.addArrangedSubview(strikesNumber)
        
        boardStack.addArrangedSubview(outStack)
//        outStack.widthAnchor.constraint(equalTo: boardStack.widthAnchor, multiplier: 0.22).isActive = true
        outStack.addArrangedSubview(oLabel)
        outStack.addArrangedSubview(outsNumber)
        
    }

}
