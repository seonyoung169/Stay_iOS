//
//  ViewController.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/15.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var myInfoArea: UIView!
    @IBOutlet weak var noticeArea: UIView!
    @IBOutlet weak var locationAgreeArea: UIView!
    @IBOutlet weak var logoutArea: UIView!
    @IBOutlet weak var withdrawArea: UIView!
    @IBOutlet weak var appVersionLabel: UILabel!
    
    @IBOutlet weak var friendOpenSwitch: SwitchButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setTapGesture()
        
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setView() {
        friendOpenSwitch.delegate = self
        self.backButton.isUserInteractionEnabled = true
    }
    
    func setTapGesture() {
        let myInfoTapGesture = UITapGestureRecognizer(target : self, action : #selector(tapMyInfo(sender:)))
        self.myInfoArea.addGestureRecognizer(myInfoTapGesture)
        
        let noticeTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapNotice(sender:)))
        self.noticeArea.addGestureRecognizer(noticeTapGesture)
        
        let locationAgreeTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLocationAgree(sender:)))
        self.locationAgreeArea.addGestureRecognizer(locationAgreeTapGesture)
    }
    
    @objc func tapMyInfo(sender : UIGestureRecognizer){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyInfoVC") else {
            print("MyInfoVC nil")
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapNotice(sender : UIGestureRecognizer) {
        print("tap Notice")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "NoticeVC") else {
            print("NoticeVC nil")
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapLocationAgree(sender : UIGestureRecognizer) {
        print("tap LocationAgree")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "LocationAgreeVC") else {
            print("LocationAgreeVC nil")
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SettingVC : SwieeftSwitchButtonDelegate{
    func isOnValueChange(isOn: Bool) {
        if self.friendOpenSwitch.isOn{
            
        }else{
            
        }
    }
}
