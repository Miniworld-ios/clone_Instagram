//
//  ProfileCollectionViewCell.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/02.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileEdit: UIButton!
    @IBOutlet weak var profileShare: UIButton!
  
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var feedNumber: UILabel!
    
    @IBOutlet weak var followerNumber: UILabel!
    
    @IBOutlet weak var followingNumber: UILabel!
    
    
    @IBAction func EditDidTap(_ sender: UIButton) {
        
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
        
    }

    
    func setupAttribute(){
        profileEdit.layer.cornerRadius = 5
        profileShare.layer.cornerRadius = 5
    }
    
}
