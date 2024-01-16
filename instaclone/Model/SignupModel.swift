//
//  SignupModel.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/07.
//

import Foundation

struct SignupModel: Codable {
    
    var id: String?
    var email: String?
    var name: String?
    var pw: String?
    var profile_img: String?
    var birthday: String?
}
