//
//  inputNameViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/30.
//

import UIKit

class inputNameViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func nameTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.name = text
        isvalidName = checkName(str: name)
        validateUserInfo()
    }

    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "inputPwdViewController") as! inputPwdViewController

        self.navigationController?.pushViewController(nextVC, animated: true)

        setupInfo()
    }
    
   
    var isvalidName = false
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 아이템 커스텀
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        nextButton.layer.cornerRadius = 5

       
    }
    


    
    private func setupInfo() {
        
        let signupuserInfo = SignupUserInfo.shared
        signupuserInfo.name = name

    }
    
     //유효성 검사에 따라서 UI 업데이트
    private func validateUserInfo() {
        if isvalidName {
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
    func checkName(str: String) -> Bool {
        let regex = "[a-zA-Z가-힣ㄱ-하-ㅣ\\s]{1,15}"
        return  NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: str)
    }
}
