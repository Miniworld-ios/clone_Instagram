//
//  GetUserDataManager.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/09.
//

import Foundation
import Alamofire

class GetUserDataManager {
    
    func getinfo(_ viewController: MainTabBarController,pathVariable: Int,jwttoken:String) {
        
        // getuserURL = "https://prod.digooo.shop/app/profiles/my-profile/:userId"
        let url = APIConstants.getuserURL + "\(pathVariable)"
            
        var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: jwttoken)
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: ResponseModelGetInfo.self ){ response in
            
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("MainTabBar")
                    
                    print("isSuccess: \(result.isSuccess)" )
                    print("code: \(result.code)" )
                    print("message: \(result.message)" )
                   
                    // 서버에서 가져온 정보 userinfo에 저장
                    let userinfo = SignupUserInfo.shared
                    userinfo.nickname = result.result.userInfo.user.userInstaID
                    userinfo.name = result.result.userInfo.user.userName
                    userinfo.feedNumber = result.result.userInfo.user.feedNumber
                    userinfo.followerNumber = result.result.userInfo.user.followerNumber
                    userinfo.follwoingNumber = result.result.userInfo.user.followingNumber
                    
                                       
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error)
            }
            
            }
        
    }
    
    
}
