//
//  UploadTableViewCell.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/07.
//

import UIKit

class UploadTableViewCell: UITableViewCell {

    @IBOutlet weak var uploadImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
