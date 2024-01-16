//
//  SearchViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/01.
//

import UIKit

class SearchViewController: UIViewController {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        collectionView.delegate = self
        collectionView.dataSource = self
        
       let nib = UINib(nibName: "searchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "searchCollectionViewCell")
        
    
    }
    
    

    let item = ["서치1","서치2","서치3","서치4","서치5","서치6","서치7","서치8","서치9"]

}

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCollectionViewCell", for: indexPath) as? searchCollectionViewCell else { return UICollectionViewCell()}
        
        cell.searchImage.image = UIImage(named: item[indexPath.row])
        
        //cell.searchImage.image = UIImage(named: "서치1")
        
        return cell
    }
    
    
    
    
}

extension SearchViewController : UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGFloat(collectionView.frame.width / 3 - 3 )
        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(1)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(1)
    }
}
