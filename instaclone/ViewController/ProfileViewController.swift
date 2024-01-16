//
//  MypageViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/31.
//

import UIKit
import MaterialComponents.MaterialBottomSheet


class ProfileViewController: UIViewController {
    
    
    
    
    
    var feedList = [MyFeedData]()
    var addsell: MyFeedData = MyFeedData(myfeedImage: UIImage())
    
    //var item = ["강아지", "강아지2"]
    
    
    var item = [UIImage(named: "강아지"), UIImage(named: "강아지2")]
    
    //MARK - outlet 연결
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    
    @IBOutlet weak var userId: UIButton!
    
    
    //업로드버튼 클릭
    @IBAction func uploadDidTap(_ sender: UIButton) {
        
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let vc = storyboard?.instantiateViewController(withIdentifier: "MakeHalfViewController") as! MakeHalfViewController
        
        // MDC 바텀 시트로 설정
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        
        // 보여주기
        present(bottomSheet, animated: true, completion: nil)
        
    }
    
    
    @IBAction func moreButtonDidTap(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MoreHalfViewController") as! MoreHalfViewController
        
        // MDC 바텀 시트로 설정
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        
        //높이 조절
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 470
        
        // 보여주기
        present(bottomSheet, animated: true, completion: nil)
    }
    
    
    //MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        let userinfo = SignupUserInfo.shared
        print(userinfo.nickname ?? "")
        
        
        let image1 = MyFeedData(myfeedImage: UIImage(named: "강아지")!)
        feedList.append(image1)
        let image2 = MyFeedData(myfeedImage: UIImage(named: "강아지2")!)
        feedList.append(image2)
        
        
        
        userId.setTitle(userinfo.nickname ?? "", for: .normal)
        
        addNotiObserver()
    }
    
    //실허
    private func addNotiObserver(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(senddata),
                                               name: NSNotification.Name("notiData"),
                                               object: nil)
    }
    
    @objc func senddata(notification : NSNotification){
        if notification.object is String {
            let image3 = MyFeedData(myfeedImage: UIImage(named: "고양이")!)
            feedList.append(image3)
            
        }
    }
    
    
    
    
    
    
    
    private func setupCollectionView(){
        
        //delegate 연결
        profileCollectionView.dataSource = self
        profileCollectionView.delegate = self
        
        // 셀 등록 - 프로필 정보
        let nib1 = UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
        profileCollectionView.register(nib1, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        
        // 셀 등록 - 내 피드
        let nib2 = UINib(nibName: "MyFeedCollectionViewCell", bundle: nil)
        profileCollectionView.register(nib2, forCellWithReuseIdentifier: "MyFeedCollectionViewCell")
    }
    
    
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    // 섹션 수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 아이템 수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            //print(feedList.count)
            return feedList.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section {
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell else {return UICollectionViewCell()}
            let userinfo = SignupUserInfo.shared
            cell.userNameLabel.text = userinfo.name
            cell.feedNumber.text = "\(userinfo.feedNumber! + 2)"
            cell.followingNumber.text = "\(userinfo.follwoingNumber ?? 0)"
            
            cell.followerNumber.text = "\(userinfo.followerNumber ?? 0)"
            
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyFeedCollectionViewCell", for: indexPath) as? MyFeedCollectionViewCell else {return UICollectionViewCell()}
            
            cell.feedImage.image = feedList[indexPath.row].myfeedImage
            
            return cell
        }
        
        
        
        
    }
    
}


extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(200))
           
            
            
        default:
            let size = CGFloat(collectionView.frame.width / 3 - 1)
            return CGSize(width: size, height: size)
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0 :
            return CGFloat(0)
        default :
            return CGFloat(1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0 :
            return CGFloat(0)
        default :
            return CGFloat(1)
        }
    }
    
    
    
}
