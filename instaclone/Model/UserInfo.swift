//
//  UserInfo.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/05.
//

import Foundation

class SignupUserInfo {
    
    static let shared = SignupUserInfo()
    
    var email: String?
    var name : String?
    var nickname: String?
    var password: String?
    var profile_img : String?
    var birthday: String?
    var userindex: Int?
    var jwt: String?
    var feedNumber,followerNumber,follwoingNumber: Int?
    
    
    var isinactive: Bool?
    private init() {
        
    }
}
