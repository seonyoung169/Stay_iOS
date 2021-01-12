//
//  CalendarVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/10.
//

import UIKit

class CalendarVC: UIViewController {

    @IBOutlet weak var backBtn: UIImageView!
    @IBOutlet weak var yearAndMonth: NSLayoutConstraint!
    @IBOutlet weak var currentCount: UILabel!
    @IBOutlet weak var bestCount: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackBtnTapGesture()
    }
    
    func setBackBtnTapGesture() -> Void {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.backBtn.addGestureRecognizer(gesture)
        self.backBtn.isUserInteractionEnabled = true
    }
    
    @objc func tap(sender : UIGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }
    
}
