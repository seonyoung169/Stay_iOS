//
//  ViewController.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/09.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var settingButton: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var standardDateLabel: UILabel!
    @IBOutlet weak var confirmedCountLabel: UILabel!
    
    @IBOutlet weak var circleArea: UIView!
    @IBOutlet weak var dayCountLabel: UILabel!
    @IBOutlet weak var calendarArea: UIView!
    @IBOutlet weak var friendArea: UIView!
    @IBOutlet weak var kakaoShareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustViewsLocation()
        setTapGesture()
        setKakaoShareBtn()
    }
    
    // MARK : Tap Gesture
    func setTapGesture() {
        let calendarTapGesture = UITapGestureRecognizer(target : self, action : #selector(tapCalendarArea(sender:)))
        self.calendarArea.addGestureRecognizer(calendarTapGesture)
        
        let friendTapGesture = UITapGestureRecognizer(target:self, action : #selector(tapFriendArea(sender:)))
        self.friendArea.addGestureRecognizer(friendTapGesture)
        
        let kakaoShareTapGesture = UITapGestureRecognizer(target:self, action : #selector(tapKakaoShareView(sender:)))
        self.kakaoShareView.addGestureRecognizer(kakaoShareTapGesture)
        
        self.settingButton.isUserInteractionEnabled = true
        let settingTapGesture = UITapGestureRecognizer(target:self, action : #selector(tapSettingButton(sender:)))
        self.settingButton.addGestureRecognizer(settingTapGesture)
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
    
    @objc func tapKakaoShareView(sender : UITapGestureRecognizer){
        print("kakaoshare")
    }
    
    @objc func tapSettingButton(sender : UIGestureRecognizer){
        print("tapSettingButton")
        let settingStoryboard = UIStoryboard(name: "Setting", bundle: nil)
        guard let settingVC = settingStoryboard.instantiateInitialViewController() else {
            print("settingVC nil")
            return
        }
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    // MARK : Setting View
    func setKakaoShareBtn() -> Void{
        self.kakaoShareView.layer.cornerRadius = 10
    }
    
    func adjustViewsLocation() -> Void {
        self.circleArea.translatesAutoresizingMaskIntoConstraints = false
        self.circleArea.topAnchor.constraint(equalTo: self.standardDateLabel.bottomAnchor).isActive = true
    }

}

