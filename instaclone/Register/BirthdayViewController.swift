//
//  BirthdayViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/06.
//

import UIKit

class BirthdayViewController: UIViewController {

    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    
    var birthday: String = ""
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "AddProfileImageViewController") as! AddProfileImageViewController
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        setupInfo()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 아이템 커스텀
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        nextButton.layer.cornerRadius = 5

       
        configureDatePicker()
        
    }
 
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.addTarget(self,action: #selector(datePickerValueDidChange(_:)),for: .valueChanged)
        
        self.birthdayTextField.inputView = self.datePicker
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formmater1 = DateFormatter()
        let formmater2 = DateFormatter()
        
        formmater1.dateFormat = "yyyy년 MM월 dd일"
        formmater2.dateFormat = "yyyy-MM-dd"
        
        formmater1.locale = Locale(identifier: "ko_KR")
        formmater2.locale = Locale(identifier: "ko_KR")
        
        self.diaryDate = datePicker.date
        self.birthdayTextField.text = formmater1.string(from: datePicker.date)
        birthday = formmater2.string(from: datePicker.date)
    }
    
    private func setupInfo() {
        
        let signupuserInfo = SignupUserInfo.shared
        signupuserInfo.birthday = birthday
    }
    
}

extension UITextField {


    func setDatePicker(target: Any, selector: Selector) {
        let SCwidth = self.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: SCwidth, height: 216))
        datePicker.datePickerMode = .date
        self.inputView = datePicker

        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: SCwidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar

    }
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
}
