//
//  MakeFeedViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/07.
//

import UIKit



class MakeFeedViewController: UIViewController {

    let picker = UIImagePickerController()
    
    
    
    
    
    ///
    @IBOutlet weak var feedImage: UIImageView!
    
    var addImage : UIImage?
    
    @IBAction func doneButtonDidTap(_ sender: UIBarButtonItem) {
       
        //실험
        NotificationCenter.default.post(name: NSNotification.Name("notiData"), object:content.text)
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
        
    }
                                                                         
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        self.openLibrary()
    }
    
    @IBOutlet weak var content: UITextField!
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.feedImage.isUserInteractionEnabled = true
            self.feedImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
            
            picker.delegate = self
            
        
    
    }
    

}


extension MakeFeedViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func openLibrary(){
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = false // 이미지 편집 기능 off
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
        
        self.feedImage.image = newImage
        addImage = newImage!
       
        // 이미지 -> base64 string으로 변환
        //self.profileImg = newImage
//        let imageData = profileImg?.jpegData(compressionQuality: 1)
//        let imageBase64String = imageData?.base64EncodedString()
//        //"data:image/jpeg;base64," +
//        profile_img = "data:image/jpeg;base64," + imageBase64String!
//
        //
        picker.dismiss(animated: true, completion: nil)
        
       
        
      
        }
    
    
}
