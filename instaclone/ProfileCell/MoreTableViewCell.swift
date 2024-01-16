//
//  MoreTableViewCell.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/08.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var iconLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
