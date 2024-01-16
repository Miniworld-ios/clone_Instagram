//
//  HomeFeedTableViewCell.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/31.
//

import UIKit

class HomeFeedTableViewCell: UITableViewCell {

    //유저 프로필 사진
    @IBOutlet weak var userProfile: UIImageView!
    
    //유저id
    @IBOutlet weak var userid: UILabel!
    
    
    //피드 이미지
    @IBOutlet weak var feedImage: UIImageView!
    
    // 클릭 시 이미지 변경해야되기 때문에 oulet 연결
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    
    @IBAction func bookMarkDidTap(_ sender: UIButton) {
        if bookmarkButton.isSelected {
            bookmarkButton.isSelected = false
        }else {
            bookmarkButton.isSelected = true
        }
        
    }
    
    
    @IBAction func hearDidTap(_ sender: UIButton) {
        
        if heartButton.isSelected {
            heartButton.isSelected = false
        }else {
            heartButton.isSelected = true
        }
    }
    
    //좋아요 수
    @IBOutlet weak var likeNumer: UILabel!
    
    //피드 내용
    @IBOutlet weak var feedContent: UILabel!
    
    //댓글더보기
    @IBOutlet weak var commentMore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userProfile.layer.cornerRadius = 28 / 2
        userProfile.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    
}
