//
//  ViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/29.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    var inputEmail: String = ""
    var inputPwd: String = ""

    var isvalidEmail = false
    var isvalidPwd = false
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var eyeButton: UIButton!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func eyeButtonDidTap(_ sender: Any) {
        
        if eyeButton.isSelected{
            passwordTextField.isSecureTextEntry = true
            eyeButton.isSelected = false
            print("anjwl")
        }else{
            // 보임
            eyeButton.isSelected = true
            passwordTextField.isSecureTextEntry = false
            print("보이나?")
        }
    }
    
  
    
    
    //이메일 텍스트필드버튼
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        self.inputEmail = text
        
        isvalidEmail = checkEmail(str: inputEmail)
        validateUserInfo()
        
    }
    
    
    
    //비밀번호 텍스트필드버튼
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        self.inputPwd = text
        
        isvalidPwd = checkPwd(str: inputPwd)
        validateUserInfo()
    }
    
    //로그인버튼
    @IBAction func LoginDidTap(_ sender: UIButton) {
        
        let input =  LoginModel(email: inputEmail, pw: inputPwd)
        //LoginDataManager().login(self, input)
        connectapi(input)
        
         //로그인 성공 시 mianTapBar로 화면 전환
        //main tabbar로 이동
//        let tabbar = UIStoryboard.init(name: "Main", bundle: nil)
//        guard let maintabbar = tabbar.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else {return}
//
//              (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(maintabbar, animated: false)
        
    }
    
    private func connectapi(_ parameter:LoginModel) {
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
                        self.present(alert, animated: true)
                    case 3016 : print("계정이 삭제된 유저입니다.")
                        let alert = UIAlertController(title: nil, message: "계정이 삭제된 유저입니다..",preferredStyle:.alert)
                        let okAction = UIAlertAction(title: "확인", style: .default)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    case 3014:
                        let alert = UIAlertController(title: nil, message: "아이디나 비번을 확인하세요.",preferredStyle:.alert)
                        let okAction = UIAlertAction(title: "확인", style: .default)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    default:
                        print(result.message)
                        let alert = UIAlertController(title: nil, message: "존재하지 않는 유저입니다..",preferredStyle:.alert)
                        let okAction = UIAlertAction(title: "확인", style: .default)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    }
                    
                }
            case .failure(let error):
                print(error)
//                    print(error.localizedDescription)
                
               
                
            }
            
        }
    }
    
    //페이스북로그인 버튼
    @IBAction func facebookLoginDidTap(_ sender: UIButton) {
        
        // 페이스북 로그인
        
    }
    
    //가입하기버튼
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main",bundle: nil)
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterByEmailViewController") as! RegisterByEmailViewController
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
       
    }
    
    private func setupAttribute() {
        //registerButton
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha:1)
        
        let attributes = generateButtonAttributes(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
        
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
       setupAttribute()
        
    }
    
    //유효성 검사에 따라서 UI 업데이트
   private func validateUserInfo() {
       if isvalidEmail && isvalidPwd {
           loginButton.isEnabled = true
           UIView.animate(withDuration: 0.33) {
               self.loginButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha:1)
           }
       } else{
           loginButton.isEnabled = false
           UIView.animate(withDuration: 0.33) {
               self.loginButton.backgroundColor = UIColor(red: 102/255, green: 166/255, blue: 225/255, alpha: 1)
           }
           
       }
   }
    
    
    // 유효성 검사
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    // 유효성 검사
    func checkPwd(str: String) -> Bool {
        //대문자, 소문자,특수문자, 숫자 8자 이상일 때 -> True
        let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        return  NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: str)
    }


}

