//
//  ResponseModelShop.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/09.
//

import Foundation

struct ResponseModelShop: Codable {

    var isSuccess: Bool
    var code : Int
    var message: String
    var result: [Result3]
}

//MARK - Result3
struct Result3: Codable {
    var shopID: Int
    var imageURL: String

    enum CodingKeys: String, CodingKey {
        case shopID = "shopId"
        case imageURL = "imageUrl"
    }
}

