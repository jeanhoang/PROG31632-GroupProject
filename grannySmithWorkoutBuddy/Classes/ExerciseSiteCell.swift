//
//  ExerciseSiteCell.swift
//  grannySmithWorkoutBuddy
//
//  Created by Christopher Lewis on 2022-04-14.
//

import UIKit

class ExerciseSiteCell: UITableViewCell {

    let primaryLabel = UILabel()
    let secondaryLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        primaryLabel.textAlignment = .left
        primaryLabel.font = UIFont.boldSystemFont(ofSize: 30)
        primaryLabel.backgroundColor = .clear
        primaryLabel.textColor = .black
        
        secondaryLabel.textAlignment = .left
        secondaryLabel.font = UIFont.boldSystemFont(ofSize: 12)
        secondaryLabel.backgroundColor = .clear
        secondaryLabel.textColor = .red
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(primaryLabel)
        contentView.addSubview(secondaryLabel)
    }
    
    override func layoutSubviews() {
        primaryLabel.frame = CGRect(x: 10, y: 5, width: 460, height: 30)
        secondaryLabel.frame = CGRect(x: 10, y: 40, width: 460, height: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
