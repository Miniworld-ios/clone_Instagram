//
//  UserDeleteDataManager.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/08.
//

import Foundation
import Alamofire

class UserDelelteDataManager {
    
    func delete(_ viewController: SettingViewController,pathVariable: Int,jwttoken:String) {
        
        // deleteURL = baseURL + "/app/users/delete/:"
        let url = APIConstants.deleteURL + "\(pathVariable)"
        
//        let header: HTTPHeaders = ["X-ACCESS-TOKEN": jwttoken]
    
        var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: jwttoken)
        AF.request(url, method: .patch, headers: header).validate().responseDecodable(of: ResponseModel2.self ){ response in
            
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("삭제성공")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error)
            }
            
            }
        
    }
}
