//
//  NoticeVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/29.
//

import UIKit

class NoticeVC: UIViewController {

    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var noticeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
        noticeTableView.estimatedRowHeight = 80
        noticeTableView.rowHeight = UITableView.automaticDimension
        noticeTableView.tableFooterView = UIView()
        
        backButton.isUserInteractionEnabled = true
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NoticeVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell") as! NoticeTableViewCell
        
        cell.titleLabel.text = "subwayjfewoaijflzklkzdnflksdahfoeiwhaoznlvm;ldkjfwoaiehfnlamnlksamldahfoeiwhaoznlvm;ldkjfwoadahfoeiwhaoznlvm;ldkjfwoa"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
