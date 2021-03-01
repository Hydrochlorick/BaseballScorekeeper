//
//  HitMenuVC.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/28/21.
//

import UIKit

class HitMenuVC: UIViewController {
    
    let menuStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
