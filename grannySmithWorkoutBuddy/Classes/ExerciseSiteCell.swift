/*
 Author: Christopher Lewis
 This class is used for designing the table cells used for the exercise table view. Each cell contains a primary label for the exercise's name and a secondary label for the exercise's muscle group
 */

import UIKit

class ExerciseSiteCell: UITableViewCell {

    let primaryLabel = UILabel()
    let secondaryLabel = UILabel()
    
    //gives the design for both the primary label and the secondary label to be added to the table cell. It then adds the labels to the cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        primaryLabel.textAlignment = .left
        primaryLabel.font = UIFont.boldSystemFont(ofSize: 20)
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
    
    //specifies the area within the cell given to the primary label and the secondary label
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
