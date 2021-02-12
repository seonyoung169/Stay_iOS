//
//  LocationAgreeVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/03.
//

import UIKit

class LocationAgreeVC: UIViewController {

    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backButton.isUserInteractionEnabled = true
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
