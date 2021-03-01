//
//  ButtonStackView.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/28/21.
//

import UIKit

class ButtonStackView: UIView {
    
    let buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    let ballButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ball", for: .normal)
        button.setTitleColor(UIColor(named: "offWhite"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let strikeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Strike", for: .normal)
        button.setTitleColor(UIColor(named: "offWhite"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let foulButton: UIButton = {
        let button = UIButton()
        button.setTitle("Foul", for: .normal)
        button.setTitleColor(UIColor(named: "offWhite"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let outButton: UIButton = {
        let button = UIButton()
        button.setTitle("Out", for: .normal)
        button.setTitleColor(UIColor(named: "offWhite"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let hitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hit", for: .normal)
        button.setTitleColor(UIColor(named: "offWhite"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        self.addSubview(buttonStack)
        buttonStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        buttonStack.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        
        buttonStack.addArrangedSubview(ballButton)
        buttonStack.addArrangedSubview(strikeButton)
        buttonStack.addArrangedSubview(foulButton)
        buttonStack.addArrangedSubview(outButton)
        buttonStack.addArrangedSubview(hitButton)
    }
    

}
