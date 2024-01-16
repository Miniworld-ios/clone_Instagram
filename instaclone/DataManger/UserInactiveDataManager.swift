//
//  UserInactiveDataManager.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/10.
//

import Foundation
import Alamofire

class UserInactiveDataManager {
    
    func inactive(_ viewController: SettingViewController,pathVariable: Int,jwttoken:String) {
        
        //  계정 비활성화 = "https://prod.digooo.shop/app/users/:userId"
        let url = APIConstants.inactiveURL + "\(pathVariable)"
        
        var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: jwttoken)
        AF.request(url, method: .patch, headers: header).validate().responseDecodable(of: ResponseModel2.self ){ response in
            
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("비활성 성공")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error)
            }
            
            }
        
    }
}

    

