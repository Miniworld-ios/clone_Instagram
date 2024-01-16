//
//  RegisterByEmailViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/30.
//

import UIKit

class RegisterByEmailViewController: UIViewController {

    // 이메일 텍스트필드
    @IBOutlet weak var emailTextField: UITextField!
    
    // 이메일 입력
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
        
        // 유효성검사
        isvalidEmail = checkEmail(str: email)
        validateUserInfo()
    }
    
    
    var email: String = ""
    var isvalidEmail = false
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {

        let nextVC = storyboard?.instantiateViewController(withIdentifier: "inputNameViewController") as! inputNameViewController
    
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        setupInfo()
    }
    
    //MARK - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 아이템 커스텀
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        nextButton.layer.cornerRadius = 5
    }
    
    private func setupInfo() {
        
        let signupuserInfo = SignupUserInfo.shared
        signupuserInfo.email = email

    }
    
     //유효성 검사에 따라서 UI 업데이트
    private func validateUserInfo() {
        if isvalidEmail {
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
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
}




