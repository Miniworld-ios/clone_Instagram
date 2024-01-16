//
//  inputPwdViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/30.
//

import UIKit

class inputPwdViewController: UIViewController {

    var isvalidPassword = false
    var password : String = ""
    
    
    @IBOutlet weak var eyeButton: UIButton!
    
    @IBAction func eyeButtonDidTap(_ sender: UIButton) {
        if eyeButton.isSelected{
            pwdTextField.isSecureTextEntry = true
            eyeButton.isSelected = false
            
        }else{
            // 보임
            eyeButton.isSelected = true
            pwdTextField.isSecureTextEntry = false
            
        }
    }
    
    @IBOutlet weak var pwdTextField: UITextField!
    
    @IBAction func pwdTextFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        self.password = text
        isvalidPassword = checkPwd(str: password)
        validateUserInfo()
    }
    
  
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "CreateNameViewController") as! CreateNameViewController
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        setupInfo()
    }
    
    //MARK - Life Cyle
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 아이템 커스텀
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        nextButton.layer.cornerRadius = 5

    }
    
    private func setupInfo() {
        
        let signupuserInfo = SignupUserInfo.shared
        signupuserInfo.password = password

    }
    
     //유효성 검사에 따라서 UI 업데이트
    private func validateUserInfo() {
        if isvalidPassword {
            nextButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.nextButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha:1)
            }
        } else{
            nextButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.nextButton.backgroundColor = UIColor(red: 102/255, green: 166/255, blue: 225/255, alpha: 1)
            }
            
        }
    }
    
    // 유효성 검사
    func checkPwd(str: String) -> Bool {
        
        //대문자, 소문자,특수문자, 숫자 8자 이상일 때 -> True
        let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        return  NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: str)
        
    }

}
