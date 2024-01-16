//
//  ResponseModel2.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/08.
//

import Foundation

struct ResponseModel2: Codable {
    var isSuccess: Bool
    var code : Int
    var message: String
    var result: String
    
}
