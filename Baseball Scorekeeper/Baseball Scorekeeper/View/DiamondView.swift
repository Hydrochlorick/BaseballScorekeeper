//
//  DiamondView.swift
//  Baseball Scorekeeper
//
//  Created by Luna Perry on 3/1/21.
//

import UIKit

class DiamondView: UIView {

    let diamondBanana: UIImageView = {
        let diamondImage = UIImageView()
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.contentMode = .scaleAspectFit
        return diamondImage
    }()

}
