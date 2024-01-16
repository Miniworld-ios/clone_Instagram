//
//  RegisterDoneViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/30.
//

import UIKit
import Alamofire

class RegisterDoneViewController: UIViewController {
    
    
    @IBAction func DoneButtonDidTap(_ sender: UIButton) {
        
        //main tabbar로 이동
//        let tabbar = UIStoryboard.init(name: "Main", bundle: nil)
//        guard let maintabbar = tabbar.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else {return}
//
//              (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(maintabbar, animated: false)
        
        // 로그인 화면으로 이동
        let loginvc = UIStoryboard.init(name: "Main", bundle: nil)
        guard let mainlogin = loginvc.instantiateViewController(withIdentifier: "MainLoginViewController") as? MainLoginViewController else {return}
              
              (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(mainlogin, animated: false)
        
    }
    
    //
        private func setupInfo() {

            let userInfo = SignupUserInfo.shared
    //        userInfo.name = nameTextField.text ?? ""

            print("userinfo.email: \(userInfo.email ?? "")")
            print("userinfo.name: \(userInfo.name ?? "")")
            print("userinfo.password: \(userInfo.password ?? "")")
            print("userinfo.nickname: \(userInfo.nickname ?? "")")
            print("userinfo.birthday: \(userInfo.birthday ?? "")")
            print("userinfo.profile: \(userInfo.profile_img ?? "")")
            
//
//            let input = SignupModel(id: userInfo.nickname!,email: userInfo.email!,name: userInfo.name!, pw: userInfo.password!,profile_img: userInfo.profile_img!,birthday: userInfo.birthday!)
//            SignupDataManager().signup(self, input)
            
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 아이템 커스텀
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        setupInfo()

      
    }
    

    
}
