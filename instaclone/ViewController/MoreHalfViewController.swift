//
//  SettingHalfViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/08.
//

import UIKit

class MoreHalfViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var bottomsheetView: UIView!
    
    let item = ["설정","내 활동","보관","QR 코드", "저장됨", "디지털 자산", "친한 친구", "즐겨찾기"]
    let imageitem = ["설정","내활동","보관","QR코드", "저장됨", "디지털자산", "친한친구", "즐겨찾기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        bottomsheetView.layer.cornerRadius = 16
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "MoreTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MoreTableViewCell")
    }
}

extension MoreHalfViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as? MoreTableViewCell else { return UITableViewCell()}
        cell.iconLabel.text = item[indexPath.row]
        cell.iconImage.image = UIImage(named: imageitem[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.contentView.backgroundColor = UIColor.white
        
        // 설정 cell 선택 시 화면 전환
        switch indexPath.row {
        case 0: self.performSegue(withIdentifier: "SettingViewController", sender: nil)
        
            
        default:
            return
        }
        
    }
    
    
    
}
