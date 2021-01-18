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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
