//
//  WeightSiteCell.swift
//  grannySmithWorkoutBuddy
//
//  Created by Jean Hoang on 2022-04-10.
//

import UIKit

class WeightSiteCell: UITableViewCell {
    
    let weightLabel = UILabel()
    let dateLabel = UILabel()
    
    //Styling cells content
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    
        weightLabel.textAlignment = .right
        weightLabel.font = UIFont.boldSystemFont(ofSize : 20)
        weightLabel.textColor = .purple
        
        dateLabel.textAlignment = .left
        dateLabel.font = UIFont.boldSystemFont(ofSize : 28)
        dateLabel.textColor = .black
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(weightLabel)
        contentView.addSubview(dateLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Positioning cell content
    override func layoutSubviews() {
        weightLabel.frame = CGRect(x: 10, y: 10, width: 250, height: 30)
        dateLabel.frame = CGRect(x:10, y: 10, width: 250, height: 30)
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
