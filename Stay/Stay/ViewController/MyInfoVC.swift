//
//  MyInfoVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/18.
//

import UIKit

class MyInfoVC: UIViewController {
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var homeAddressLabel: UIView!
    @IBOutlet weak var workAddressLabel: UIView!
    @IBOutlet weak var theOther: UILabel!
    @IBOutlet weak var editMyInfoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        setUserImageView()
    }
    
    func setUserImageView() {
        self.userImageView.layer.cornerRadius = 24
    }
    
    func setBackButton() {
        self.backButton.isUserInteractionEnabled = true
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapEdit(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "EditMyInfoVC") else {
            print("get VC nil")
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
