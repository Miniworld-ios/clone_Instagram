//
//  ShopViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/02.
//

import UIKit
import Alamofire
import Kingfisher

class ShopViewController: UIViewController {

//    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    var shops:[Result3] = []
  
    //var imgurl: UIImageView!
    
    var list = [ShopModel]()
    
    //
    var urlString : [String] = []
    
    @IBOutlet weak var imageView: UIImageView!
 
    @IBOutlet weak var imageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setupCollectionView()
        //connectApi()
        
        
        connectapi()
//        let url = imgurl1
//        imgurl.load(url: url!)
        
        print("shops.coount: \(shops.count)")
    }
    
        
    private func connectapi() {
        // shop전체 피드 조회 - 더미데이터 = "https://prod.digooo.shop/app/shops"
        let url = APIConstants.shopURL
        
        AF.request(url, method: .get).validate().responseDecodable(of: ResponseModelShop.self ){ [self] response in
            
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("Shop화면입니다.")
                    
                    shops = result.result
                 
                    // 테스트
                    let imgurl1 = URL(string: shops[0].imageURL)
                    let imgurl2 = URL(string: shops[1].imageURL)
                    
//                    let item1 = ShopModel(shopID: shops[0].shopID, imageURL: imgurl1!)
//                    list.append(item1)
//                    let item2 = ShopModel(shopID: shops[1].shopID, imageURL: imgurl2!)
//                    list.append(item2)
//
                    
                    let url = imgurl1
                    let url2 = imgurl2
                    
                
                    imageDownload(url: url!)
                    imageDownload(url: url2!)
                    
                    let item1 = ShopModel(shopID: shops[0].shopID, imageURL: shops[0].imageURL)
                    list.append(item1)
                    let item2 = ShopModel(shopID: shops[1].shopID, imageURL: shops[1].imageURL)
                    list.append(item2)
                    
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func imageDownload(url: URL) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    print("Download image fail : \(url)")
                    return
            }

            DispatchQueue.main.async() {[weak self] in
                print("Download image success \(url)")

                self?.imageView.image = image
                self?.imageView2.image = image
            }
        }.resume()
    }
  
//    private func setupCollectionView(){
//
//        //delegate 연결
//        shopCollectionView.dataSource = self
//        shopCollectionView.delegate = self
//
//        let nib = UINib(nibName: "ShopCollectionViewCell", bundle: nil)
//        shopCollectionView.register(nib, forCellWithReuseIdentifier: "ShopCollectionViewCell")
//    }
   

}


//extension ShopViewController : UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        //return 10
//
//        //실험
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionViewCell", for: indexPath) as? ShopCollectionViewCell else {return UICollectionViewCell()}
//        if let urlString = list[indexPath.row - 1].imageURL{
//            let url = URL(string: urlString)
//            cell.shopImage.kf.setImage(with:url)
//        }
//
//        //cell.shopImage.kf.setImage(with:)
//        //UIImage(urlImageList[indexPath.row])
//
//        return cell
//    }
//
//
//}
//
//extension ShopViewController : UICollectionViewDelegateFlowLayout{
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let size: CGFloat = UIScreen.main.bounds.width / 2 - 1
//
//        return CGSize(width: size, height: size)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//}
