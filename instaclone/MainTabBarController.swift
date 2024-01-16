//
//  MainTabBarViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/30.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        connectApi()
    }
    
    private func connectApi() {
        
        let userinfo = SignupUserInfo.shared
        let jwt = userinfo.jwt
        let pathvariable = userinfo.userindex
        GetUserDataManager().getinfo(self, pathVariable: pathvariable!, jwttoken: jwt!)
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
}
