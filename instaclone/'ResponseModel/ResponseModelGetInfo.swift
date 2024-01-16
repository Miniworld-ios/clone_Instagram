//
//  ResponseModelGetInfo.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/09.
//

import Foundation

struct ResponseModelGetInfo : Codable {
    
    var isSuccess: Bool
    var code : Int
    var message: String
    var result: Result2
}

struct Result2: Codable {
    var feedImgInfo: FeedImgInfo
    var userInfo: UserInfo
}

struct FeedImgInfo: Codable {
    var feedImg : [FeedImg]
    
}

struct FeedImg :Codable {
    
    var feedIdx: Int
    var imageURL: String
    
    enum CodingKeys: String, CodingKey {
            case feedIdx
            case imageURL = "imageUrl"
        }
}

struct UserInfo: Codable {
    var user: User
    
}

struct User: Codable {
    var userIdx: Int
    var userInstaID, userName, profileImg: String
    var feedNumber, followerNumber, followingNumber: Int

    enum CodingKeys: String, CodingKey {
        case userIdx
        case userInstaID = "userInstaId"
        case userName, profileImg, feedNumber, followerNumber, followingNumber
    }
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
