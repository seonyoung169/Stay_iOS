//
//  FriendVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/10.
//

import UIKit

class FriendVC: UIViewController {
    
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
    
    // MARK : Getting Data from Server
    func getDataFromServer() {
        FriendService.shared.getFriendList() {
            result in
            switch result{
            case.success(let successData) :
                print("SUCCESS : ", successData)
                self.userAndFriendData = successData.data
                self.setUserData()
            case.failure(let failData) :
                print("FAIL : ", failData)
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
    
    // MARK : View Setting
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


// MARK : tablaview function
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
