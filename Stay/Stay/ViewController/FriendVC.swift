//
//  FriendVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/10.
//

import UIKit

//struct Friend {
//    let name : String
//    let days : Int
//}

class FriendVC: UIViewController {
//    let friendList : [Friend] = [
//        Friend(name: "최서정", days: 12), Friend(name: "최고운", days: 11), Friend(name: "김다은", days: 10),
//        Friend(name: "양시연", days: 8), Friend(name: "박종근", days: 7), Friend(name: "이한빈", days: 5),
//        Friend(name: "김우용", days: 4), Friend(name: "최윤호", days: 2), Friend(name: "박주연", days: 0),
//        Friend(name: "신예지", days: 0), Friend(name: "박선희", days: 0), Friend(name: "이선영", days: 0),
//    ]
    
    @IBOutlet weak var backBtn: UIImageView!
    @IBOutlet weak var nameMessage: UILabel!
    @IBOutlet weak var distanceMessage: UILabel!
    @IBOutlet weak var friendTableView: UITableView!
    @IBOutlet weak var inviteFriendBtn: UIView!
    
    var userAndFriendData : FriendData! {
        didSet {self.friendTableView.reloadData()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBtn.isUserInteractionEnabled = true
        setFriendTableView()
        setInviteBox()
        getDataFromServer()
        
    }
    
    func getDataFromServer() {
        FriendService.shared.getFriendList() {
            result in
            switch result{
            case.success(let successData) :
                print("************** success **************")
                print(successData)
                self.userAndFriendData = successData.data
                self.setUserData()
            case.failure(let failData) :
                print("************** failure **************")
                print(failData)
            }
        }
    }
    
    func setUserData() {
        var message = "\(self.userAndFriendData.user.name)님,"
        
        var myIndex = 0
        for i in 0...self.userAndFriendData.friends.count-1 {
            if(self.userAndFriendData.friends[i].name == self.userAndFriendData.user.name){
                myIndex = i
            }
        }
        
        let rank = self.userAndFriendData.friends[myIndex].rank
        if(rank < 3){
            message += " 지금 \(rank)등이에요🎉"
        }
        
        self.nameMessage.text = message
        self.distanceMessage.text = "연속 \(self.userAndFriendData.user.currentRecord)일 거리두기 중!"
    }
    
    func setFriendTableView() -> Void {
        self.friendTableView.dataSource = self
        self.friendTableView.delegate = self
        self.friendTableView.tableFooterView = UIView()
    }
    
    @IBAction func goToHome(_ sender: Any) {
        print("friend")
        self.navigationController?.popViewController(animated: true)
    }
    
    func setInviteBox() -> Void {
        self.inviteFriendBtn.layer.cornerRadius = 10
    }
    
}

extension FriendVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.userAndFriendData else{
            return 10
        }
        return data.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell
        
        guard let data = self.userAndFriendData else {
            cell.name.text = "양시연"
            cell.days.text = "비공개"
            return cell
        }
        
        let rank = data.friends[indexPath.row].rank
        if rank < 4 {
            switch rank {
            case 1:
                cell.rankImage.image = UIImage(named: "icFirstPlace")
            case 2:
                cell.rankImage.image = UIImage(named: "icSecondPlace")
            case 3:
                cell.rankImage.image = UIImage(named: "icThirdPlace")
            default:
                cell.rankImage.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
            }
        }
        
        cell.name.text = data.friends[indexPath.row].name
        if !data.friends[indexPath.row].isPrivate {
            cell.days.text = "\(data.friends[indexPath.row].currentRecord)일"
        }else{
            cell.days.text = "비공개"
            cell.days.tintColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
