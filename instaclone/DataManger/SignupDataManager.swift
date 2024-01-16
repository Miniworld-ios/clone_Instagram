//
//  SignupDataManager.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/07.
//

import Foundation
import Alamofire

class SignupDataManager {
    func signup(_ viewController: AddProfileImageViewController, _ parameter: SignupModel) {
        
        let url = APIConstants.signUpURL
        
        AF.request(url, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil ).validate().responseDecodable(of: ResponseModel.self ){ response in

            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("회원가입성공")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error)

            }

        }

    }
    
}
