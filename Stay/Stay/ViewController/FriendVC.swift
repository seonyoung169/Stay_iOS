//
//  FriendVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/10.
//

import UIKit

struct Friend {
    let name : String
    let days : Int
}

class FriendVC: UIViewController {
    let friendList : [Friend] = [
        Friend(name: "최서정", days: 12), Friend(name: "최고운", days: 11), Friend(name: "김다은", days: 10),
        Friend(name: "양시연", days: 8), Friend(name: "박종근", days: 7), Friend(name: "이한빈", days: 5),
        Friend(name: "김우용", days: 4), Friend(name: "최윤호", days: 2), Friend(name: "박주연", days: 0),
        Friend(name: "신예지", days: 0), Friend(name: "박선희", days: 0), Friend(name: "이선영", days: 0),
    ]
    
    @IBOutlet weak var backBtn: UIImageView!
    @IBOutlet weak var nameMessage: UILabel!
    @IBOutlet weak var distanceMessage: UILabel!
    @IBOutlet weak var friendTableView: UITableView!
    @IBOutlet weak var inviteFriendBtn: UIView!
    @IBOutlet weak var friendTableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFriendTableView()
        setInviteBox()
    }
    
    func setFriendTableView() -> Void {
        self.friendTableView.dataSource = self
        self.friendTableView.delegate = self
        self.friendTableView.tableFooterView = UIView()
        self.friendTableViewHeight.constant = CGFloat(Double(self.friendList.count) * 50.5)
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
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell
        
        cell.name.text = friendList[indexPath.row].name
        cell.days.text = "\(friendList[indexPath.row].days)일"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
