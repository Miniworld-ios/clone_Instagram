//
//  AddProfileImageViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/30.
//

import UIKit
import Alamofire

class AddProfileImageViewController: UIViewController {
    
    
    let picker = UIImagePickerController()
    
    var profileImg: UIImage!
    var profile_img: String = "" 
    
    @IBAction func addimageDidTap(_ sender: UIButton) {
        
        let alert =  UIAlertController(title: "사진 추가", message: nil, preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default)
        { (action) in self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default)
        { (action) in

        self.openCamera()

        }


        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)


        alert.addAction(library)

        alert.addAction(camera)

        alert.addAction(cancel)

        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBAction func doneButtonDidTap(_ sender: UIButton) {
        
        setupInfo()
        
        
        let userInfo = SignupUserInfo.shared
        // 유저 생성 api
        let input = SignupModel(id: userInfo.nickname!,email: userInfo.email!,name: userInfo.name!, pw: userInfo.password!,profile_img: userInfo.profile_img!,birthday: userInfo.birthday!)
        SignupDataManager().signup(self, input)
        
        
        // api성공시
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "RegisterDoneViewController") as! RegisterDoneViewController
            
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    private func setupInfo() {
        
        let signupuserInfo = SignupUserInfo.shared
        signupuserInfo.profile_img = profile_img
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 아이템 커스텀
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        picker.delegate = self
        
        doneButton.layer.cornerRadius = 5

        setupAtrribute()
    }
    
    
    private func setupAtrribute() {
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.size.width / 2
        profileImageView.clipsToBounds = true
        
    }
}

extension AddProfileImageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func openLibrary(){
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 on
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        picker.sourceType = .camera
        present(picker, animated: false, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //simulator로 확대 모션을 취하려면 option키를 눌러야 함!
        
        
        var newImage: UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }
        
        self.profileImageView.image = newImage
        
       
        // 이미지 -> base64 string으로 변환
        //self.profileImg = newImage
//        let imageData = profileImg?.jpegData(compressionQuality: 1)
//        let imageBase64String = imageData?.base64EncodedString()
//        //"data:image/jpeg;base64," +
//        profile_img = "data:image/jpeg;base64," + imageBase64String!
//
        //
        picker.dismiss(animated: true, completion: nil)
        
        doneButton.isEnabled = true
        
      
        }
}
    
  
    

