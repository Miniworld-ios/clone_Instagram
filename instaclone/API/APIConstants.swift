//
//  APIConstants.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/07.
//

import Foundation

struct APIConstants {
    
    // MARK - Base URL
    static let baseURL = "https://prod.digooo.shop"

    // MARK = Feature URL
    // userAPI = "https://prod.digooo.shop/app/users"
    static let signUpURL = baseURL + "/app/users"
    
    //login = "https://prod.digooo.shop/app/users/log-in"
    static let loginURL = baseURL + "/app/users/log-in"
    
    // 계정 삭제 = "https://prod.digooo.shop/app/users/delete/:userId"
    static let deleteURL = baseURL + "/app/users/delete/"
    
    // 내 프로필 정보 불러오기 = "https://prod.digooo.shop/app/profiles/my-profile/:userId"
    static let getuserURL = baseURL + "/app/profiles/my-profile/"
    
    // shop전체 피드 조회 - 더미데이터 = "https://prod.digooo.shop/app/shops"
    static let shopURL = baseURL + "/app/shops"
    
    // 계정 비활성화 = "https://prod.digooo.shop/app/users/:userId"
    static let inactiveURL = baseURL + "/app/users/"
    
    // 피드 작성 = "https://prod.digooo.shop/app/feeds/:userId"
    static let makefeedURL = baseURL + "/app/feeds/"
    
}
