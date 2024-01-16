//
//  ResponseModel.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/07.
//

import Foundation

struct ResponseModel: Codable {
    var isSuccess: Bool
    var code : Int
    var message: String
    var result: Result?
    
}


struct Result: Codable{
    var userIdx: Int
    var jwt: String
}
