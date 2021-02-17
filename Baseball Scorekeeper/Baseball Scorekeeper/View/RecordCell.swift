//
//  RecordCell.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/15/21.
//

import UIKit

class RecordCell: UITableViewCell {
    
    let background: UIView = {
        let background = UIView()
        background.backgroundColor = #colorLiteral(red: 0.8186396956, green: 0.7955000997, blue: 1, alpha: 1)
        background.layer.cornerRadius = 5
        background.layer.masksToBounds = true
        return background
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Initializer for cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.contentView.addSubview(background)
        background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
}
