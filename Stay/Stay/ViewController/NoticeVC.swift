//
//  NoticeVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/25.
//

import UIKit

class NoticeVC: UIViewController {
    
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var noticeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
    
    }

}

extension NoticeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for : indexPath) as! NoticeTableViewCell
        
        return cell
    }
}
