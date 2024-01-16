//
//  HomeViewController.swift
//  instaclone
//
//  Created by 심정민 on 2023/01/31.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var FeedList : [Feed] = []
    
    var storyfeed : [StoryFeed] = []
    
    func updateFeed() {
        let feed1 = Feed(userid: "seoultravel", likeNumber: 803, content: "seoultravel #해방촌 뷰 맛짖 카페 종결판", imageString: "피드1",profileString: "seoultravel",commentNumber:56)
        FeedList.append(feed1)
        
        let feed2 = Feed(userid: "seoultravel", likeNumber: 1286, content: "seoultravel 🍤🍤새우버거 폼 미쳤다...ㄷㄷ 🍤🍤", imageString: "피드2",profileString: "seoultravel",commentNumber:1208)
        FeedList.append(feed2)
        
        let feed3 = Feed(userid: "joonmattang",likeNumber: 433, content: "joonmattang 수제 칼집 3000번 낸 삼겹살집..", imageString: "피드3",profileString: "joonmattang",commentNumber:15)
        FeedList.append(feed3)
        
        let feed4 = Feed(userid: "seoul_trends",likeNumber: 1505, content: "seoul_trends 대학로 데이트하는 커플 참고", imageString: "피드4",profileString: "seoul_trends",commentNumber:2002)
        FeedList.append(feed4)
        
        
        let story1 = StoryFeed(profile_img: "flower.Ieesang", userid: "flower.Ieesang")
        storyfeed.append(story1)
        let story2 = StoryFeed(profile_img: "here_travely", userid: "here_travely")
        storyfeed.append(story2)

        let story3 = StoryFeed(profile_img: "formade", userid: "formade")
        storyfeed.append(story3)

        let story4 = StoryFeed(profile_img: "seoultravel", userid: "seoultravel")
        storyfeed.append(story4)

        let story5 = StoryFeed(profile_img: "joonmattang", userid: "joonmattang")
        storyfeed.append(story5)

        let story6 = StoryFeed(profile_img: "seoul_trends", userid: "seoul_trends")
        storyfeed.append(story6)
        
        let story7 = StoryFeed(profile_img: "siniple", userid: "siniple")
        storyfeed.append(story7)
        
        let story8 = StoryFeed(profile_img: "kim_seungh", userid: "kim_seungh")
        storyfeed.append(story8)
        
        
        
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "HomeFeedTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HomeFeedTableViewCell")
        
        
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        
        updateFeed()

    }
    

    
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else{ return UITableViewCell() }
          
            
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFeedTableViewCell", for: indexPath) as? HomeFeedTableViewCell else{ return UITableViewCell() }
            cell.userid.text = FeedList[indexPath.row-1].userid
            cell.feedImage.image = UIImage(named: FeedList[indexPath.row-1].imageString)
            cell.likeNumer.text = "좋아요 \(FeedList[indexPath.row-1].likeNumber)개"
            cell.feedContent.text = FeedList[indexPath.row-1].content
            cell.userProfile.image = UIImage(named: FeedList[indexPath.row-1].profileString)
            cell.commentMore.text = "댓글 \(FeedList[indexPath.row-1].commentNumber)개 모두 보기"
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 80
        }else {
            return 550
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.contentView.backgroundColor = UIColor.white
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyfeed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell()}
        cell.userProfile.image = UIImage(named: "\(storyfeed[indexPath.row].profile_img)")
        cell.userId.text = storyfeed[indexPath.row].userid
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
    
}
