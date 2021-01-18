//
//  ViewController.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/15.
//

import UIKit

class SettingVC: UIViewController {
    
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backButton.isUserInteractionEnabled = true
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
}
