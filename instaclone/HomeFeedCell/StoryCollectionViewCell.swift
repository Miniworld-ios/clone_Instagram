//
//  StoryCollectionViewCell.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/07.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    
 
    @IBOutlet weak var userId: UILabel!
    
    @IBOutlet weak var userProfile: UIImageView!
    
    //@IBOutlet weak var imageViewUserProfile: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userProfile.layer.cornerRadius = 48/2
        
    }

}
