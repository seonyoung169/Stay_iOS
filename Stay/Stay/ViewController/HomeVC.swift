//
//  ViewController.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/09.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var settingBtn: UIBarButtonItem!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var standardDateLabel: UILabel!
    @IBOutlet weak var confirmedCountLabel: UILabel!
    @IBOutlet weak var dayCountLabel: UILabel!
    @IBOutlet weak var calendarArea: UIView!
    @IBOutlet weak var friendArea: UIView!
    
    @IBOutlet weak var kakaoShareBtn: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapGesture()
        setKakaoShareBtn()
    }
    
    // MARK : Tap Gesture
    func setTapGesture() {
        let calendarTapGesture = UITapGestureRecognizer(target : self, action : #selector(tapCalendarArea(sender:)))
        self.calendarArea.addGestureRecognizer(calendarTapGesture)
        
        let friendTapGesture = UITapGestureRecognizer(target:self, action : #selector(tapFriendArea(sender:)))
        self.friendArea.addGestureRecognizer(friendTapGesture)
    }
    @objc func tapCalendarArea(sender : UITapGestureRecognizer){
        let calendarStoryboard = UIStoryboard(name: "Calendar", bundle: nil)
        guard let calendarVC = calendarStoryboard.instantiateInitialViewController() else {
            print("calendarVC nil")
            return
        }
        self.navigationController?.pushViewController(calendarVC, animated: true)
        
    }
    @objc func tapFriendArea(sender : UITapGestureRecognizer) {
        let friendStoryboard = UIStoryboard(name: "Friend", bundle: nil)
        guard let friendVC = friendStoryboard.instantiateInitialViewController() else {
            print("friendVC nil")
            return
        }
        self.navigationController?.pushViewController(friendVC, animated: true)
    }
    
    // MARK : Setting View
    func setKakaoShareBtn() -> Void{
        self.kakaoShareBtn.layer.cornerRadius = 10
    }
    

}

