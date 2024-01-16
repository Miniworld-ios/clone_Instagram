//
//  LoginDataManager.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/08.
//

import Foundation

import Alamofire

class LoginDataManager {
    func login(_ viewController: LoginViewController, _ parameter: LoginModel) {
        
        let url = APIConstants.loginURL
        
        AF.request(url, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default , headers: nil ).validate().responseDecodable(of: ResponseModel.self ){ response in
//            let result = try! decoder.decode(Result.self, from:self.json)
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("로그인성공")
                    
                    let userinfo = SignupUserInfo.shared
                    userinfo.userindex = result.result?.userIdx ?? 0
                    userinfo.jwt = result.result?.jwt ?? "토큰 없습니다."
                    
                          
                    
                    
                    // 로그인 성공 시 mianTapBar로 화면 전환
                    let tabbar = UIStoryboard.init(name: "Main", bundle: nil)
                    guard let maintabbar = tabbar.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else {return}

                          (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(maintabbar, animated: false)
                    
                    
                } else {
                    switch result.code {
                    case 3015: print("계정이 비활성화된 유저입니다.")
                        let alert = UIAlertController(title: nil, message: "계정이 비활성화된 유저입니다..",preferredStyle:.alert)
                        let okAction = UIAlertAction(title: "확인", style: .default)
                        alert.addAction(okAction)
                        //self.present(alert, animated: true)
                    case 3016 : print("계정이 삭제된 유저입니다.")
                        let alert = UIAlertController(title: nil, message: "계정이 삭제된 유저입니다..",preferredStyle:.alert)
                        let okAction = UIAlertAction(title: "확인", style: .default)
                        alert.addAction(okAction)
                        //self.present(alert, animated: true)
                    default:
                        print(result.message)
                    }
                    
                }
            case .failure(let error):
                print(error)
//                    print(error.localizedDescription)
                
               
                
            }
            
        }
        
    }
}
