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
    
    var noticeList : [NoticeData]! {
        didSet { self.noticeTableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
        noticeTableView.estimatedRowHeight = 80
        noticeTableView.rowHeight = UITableView.automaticDimension
        noticeTableView.tableFooterView = UIView()
        
        backButton.isUserInteractionEnabled = true
        
        getDataFromServer()
    }
    
    // MARK : Getting Data from Server
    func getDataFromServer() {
        NoticeService.shared.getNoticeList() { result in
            switch result {
            case .success(let successData):
                print("SUCCESS : ", successData)
                self.noticeList = successData.data
            case .failure(let failureData):
                print("FAILURE : ", failureData)
            }
            
        }
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NoticeVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = self.noticeList {
            return list.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell") as! NoticeTableViewCell
        
        cell.titleLabel.text = self.noticeList[indexPath.row].title
        cell.dateLabel.text = self.noticeList[indexPath.row].createdDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
