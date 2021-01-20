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
    @IBOutlet weak var friendOpenSwitch: UISwitch!
    @IBOutlet weak var locationAgreeArea: UIView!
    @IBOutlet weak var logoutArea: UIView!
    @IBOutlet weak var withdrawArea: UIView!
    @IBOutlet weak var appVersionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backButton.isUserInteractionEnabled = true
        setTapGesture()
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target : self, action : #selector(tapArea(sender:)))
        self.myInfoArea.addGestureRecognizer(tapGesture)
//        self.noticeArea.addGestureRecognizer(tapGesture)
//        self.noticeArea.addGestureRecognizer(tapGesture)
//        self.locationAgreeArea.addGestureRecognizer(tapGesture)
//        self.logoutArea.addGestureRecognizer(tapGesture)
//        self.withdrawArea.addGestureRecognizer(tapGesture)
        
    }
    @objc func tapArea(sender : UIGestureRecognizer){
        print(sender.view?.tag)
        
        guard let tag = sender.view?.tag else {
            print("view's tag nil")
            return
        }
        
        switch tag {
        case 1:
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyInfoVC") else {
                print("MyInfoVC nil")
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("default")
        }
        
        
    }

    
}
