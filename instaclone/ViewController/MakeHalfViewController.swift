//
//  MakeViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/07.
//

import UIKit

class MakeHalfViewController: UIViewController {

    
    @IBOutlet var bottomSheetView: UIView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let item = ["릴스", "게시물", "스토리", "스토리 하이라이트", "라이브 방송", "가이드"]
    let imageitem = ["릴스", "게시물", "스토리", "스토리하이라이트", "라이브방송", "가이드"]
    
    
    
    
    
    //MARK - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomSheetView.layer.cornerRadius = 16
        
        setTableView()
        
       
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "UploadTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UploadTableViewCell")
    }
   
}

extension MakeHalfViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UploadTableViewCell", for: indexPath) as? UploadTableViewCell else { return UITableViewCell()}
        cell.nameLabel.text = item[indexPath.row]
        cell.uploadImageView.image = UIImage(named: imageitem[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)!
        cell.contentView.backgroundColor = UIColor.white
        
        switch indexPath.row {
        case 1: self.performSegue(withIdentifier: "MakeFeedViewController", sender: nil)
        
            
        default:
            return
        }
    }
    
}
