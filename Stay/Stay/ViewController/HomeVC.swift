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
    
    @IBOutlet weak var calendarArea: UIView!
    @IBOutlet weak var friendArea: UIView!
    @IBOutlet weak var kakaoShareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCircleAndLabelOnView()
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
    
    // MARK : 동그라미와 그 안, 아래 라벨 코드로 동적 적용
    func setCircleAndLabelOnView() {
        let diameter = 180
        let circleVerticalLocation = self.view.frame.height * 80 / 740
        
        // Circle
        let circle = UIImageView(image: UIImage(named: "icMainCircle"))
        circle.frame = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(circle)
        circle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        circle.topAnchor.constraint(equalTo: self.standardDateLabel.bottomAnchor, constant: circleVerticalLocation).isActive = true
        
        // Text in Circle
        let circleMessage = UILabel()
        circleMessage.numberOfLines = 2
        circleMessage.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        circleMessage.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        circleMessage.textAlignment = .center
        
        let attributedString = NSMutableAttributedString(string: "연속으로 5 일\n거리두기 중 이에요!")
        let bigAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 66, weight: .medium)]
        let smallAttrinbutes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .regular)]
        attributedString.addAttributes(bigAttributes, range: _NSRange(location: 5, length: 1))
        attributedString.addAttributes(smallAttrinbutes, range: NSRange(location: 8, length: 11))
        
        circleMessage.attributedText = attributedString
        circle.addSubview(circleMessage)
        
        circleMessage.translatesAutoresizingMaskIntoConstraints = false
        circleMessage.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
        circleMessage.topAnchor.constraint(equalTo: circle.topAnchor, constant: 35).isActive = true
        
        // Text below Circle
        let message = UILabel()
        message.text = "당신은 거리두기를 잘하는 모범시민!"
        message.textAlignment = .center
        message.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        message.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.view.addSubview(message)
        
        message.translatesAutoresizingMaskIntoConstraints = false
        message.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        message.topAnchor.constraint(equalTo: circle.bottomAnchor, constant: 22).isActive = true
        
        let exception = UILabel()
        exception.text = "(집, 직장 제외)"
        exception.textAlignment = .center
        exception.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        exception.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.view.addSubview(exception)
        
        exception.translatesAutoresizingMaskIntoConstraints = false
        exception.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        exception.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 0).isActive = true
    }

}

