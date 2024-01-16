//
//  CreateNameViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/30.
//

import UIKit

class CreateNameViewController: UIViewController {

    var isvalidNickname = false
    var nickname : String = ""
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    
    @IBAction func nicknameTextFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        nickname = text
        isvalidNickname = checkNickname(str: nickname)
        validateUserInfo()
    }
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "BirthdayViewController") as! BirthdayViewController
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        setupInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 아이템 커스텀
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        nextButton.layer.cornerRadius = 5
    }
    
    private func setupInfo() {
        
        let signupuserInfo = SignupUserInfo.shared
        signupuserInfo.nickname = nickname
    }
    
    //유효성 검사에 따라서 UI 업데이트
   private func validateUserInfo() {
       if isvalidNickname {
           nextButton.isEnabled = true
           UIView.animate(withDuration: 0.33) {
               self.nextButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha:1)
           }
       }else{
           nextButton.isEnabled = false
           UIView.animate(withDuration: 0.33) {
               self.nextButton.backgroundColor = UIColor(red: 102/255, green: 166/255, blue: 225/255, alpha: 1)
           }
           
       }
   }
    
    // 유효성 검사
    func checkNickname(str: String) -> Bool {
        
        // 영문 문자, 숫자, 밑줄
        let regex = "[a-zA-Z0-9_]{1,15}"
        return  NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: str)
    }
}
