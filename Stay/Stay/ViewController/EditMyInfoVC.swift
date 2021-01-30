//
//  EditMyInfoVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/29.
//

import UIKit

class EditMyInfoVC: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeAddressArea: UIView!
    @IBOutlet weak var homeAddressLabel: UILabel!
    @IBOutlet weak var workAddressArea: UIView!
    @IBOutlet weak var workAddressLabel: UILabel!
    @IBOutlet weak var theOtherClassArea: UIView!
    @IBOutlet weak var theOtherAdressArea: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageView()
        setBackgroundBox()
        setTapGesture()
    }
    
    func setImageView() {
        profileImageView.layer.cornerRadius = 24
    }
    
    func setBackgroundBox() {
        homeAddressArea.layer.cornerRadius = 8
        homeAddressArea.layer.borderWidth = 0.5
        homeAddressArea.layer.borderColor = CGColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        workAddressArea.layer.cornerRadius = 8
        workAddressArea.layer.borderWidth = 0.5
        workAddressArea.layer.borderColor = CGColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        theOtherClassArea.layer.cornerRadius = 8
        theOtherClassArea.layer.borderWidth = 0.5
        theOtherClassArea.layer.borderColor = CGColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        theOtherAdressArea.layer.cornerRadius = 8
        theOtherAdressArea.layer.borderWidth = 0.5
        theOtherAdressArea.layer.borderColor = CGColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
    }
    
    func setTapGesture() {
        let addressTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAddress(sender:)))
        
        self.theOtherAdressArea.addGestureRecognizer(addressTapGesture)
    }
    
    @objc func tapAddress(sender : UIGestureRecognizer){
        print("address tap")
    }

}
