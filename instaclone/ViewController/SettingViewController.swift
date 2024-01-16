//
//  SettingViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/08.
//

import UIKit
import Alamofire

class SettingViewController: UIViewController {

    var isinactive = false
    
    @IBAction func inactiveButtonDidTap(_ sender: UIButton) {
        isinactive = true
        connectapi()
        
        
    }
    
    private func connectapi() {
        let userinfo = SignupUserInfo.shared
        let jwt = userinfo.jwt
        let pathvariable = userinfo.userindex
        
    
            //  계정 비활성화 = "https://prod.digooo.shop/app/users/:userId"
        let url = APIConstants.inactiveURL + "\(pathvariable ?? 0)"
            
            var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: jwt!)
            AF.request(url, method: .patch, headers: header).validate().responseDecodable(of: ResponseModel2.self ){ response in
                
                switch response.result {
                case .success(let result):
                    if result.isSuccess {
                        print("비활성 성공")
                        userinfo.isinactive = true
                        let alert = UIAlertController(title: nil, message: "계정이 비활성화되었습니다.",preferredStyle:.alert)
                        let okAction = UIAlertAction(title: "확인", style: .default)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                        
                    } else {
                        print(result.message)
                    }
                case .failure(let error):
                    print(error)
                }
                
                }
        
        
    }
    
    
    
    @IBAction func DeleteButtonDidTap(_ sender: UIButton) {
        let userinfo = SignupUserInfo.shared
        let jwt = userinfo.jwt
        let pathvariable = userinfo.userindex
            
            // deleteURL = baseURL + "/app/users/delete/:"
        let url = APIConstants.deleteURL + "\(pathvariable ?? 0)"
            
        
            var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: jwt!)
            AF.request(url, method: .patch, headers: header).validate().responseDecodable(of: ResponseModel2.self ){ response in
                
                switch response.result {
                case .success(let result):
                    if result.isSuccess {
                        print("삭제성공")
                        let alert = UIAlertController(title: nil, message: "계정이 삭제되었습니다.",preferredStyle:.alert)
                        let okAction = UIAlertAction(title: "확인", style: .default)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    } else {
                        print(result.message)
                    }
                case .failure(let error):
                    print(error)
                }
                
                }
            
        // 로그인 화면으로 이동
        let loginvc = UIStoryboard.init(name: "Main", bundle: nil)
        guard let mainlogin = loginvc.instantiateViewController(withIdentifier: "MainLoginViewController") as? MainLoginViewController else {return}
              
              (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(mainlogin, animated: false)
    
        
        
        
    }
    
    
    
    @IBAction func logoutButton(_ sender: UIButton) {
        
        // 로그인 화면으로 이동
        let loginvc = UIStoryboard.init(name: "Main", bundle: nil)
        guard let mainlogin = loginvc.instantiateViewController(withIdentifier: "MainLoginViewController") as? MainLoginViewController else {return}
              
              (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(mainlogin, animated: false)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    let item = ["친구 팔로우 및 초대","알림","개인정보 보호","관리 감독", "보안", "광고", "계정", "도움말", "정보"]
    let imageitem = ["친구팔로우","알림","개인정보보호","관리감독", "보안", "광고", "계정", "도움말", "정보"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()

    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "SettingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SettingTableViewCell")
    }
    

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell()}
        cell.iconLabel.text = item[indexPath.row]
        cell.iconImage.image = UIImage(named: imageitem[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.contentView.backgroundColor = UIColor.white
        
    }
}
