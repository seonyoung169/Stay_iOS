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
    @IBOutlet weak var editMyInfoButton: UIButton!
    @IBOutlet weak var myPlaceTableView: UITableView!
    
    var myPlaceList : [MyPlaceData]! {
        didSet { myPlaceTableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        setUserImageView()
        setTableView()
        getDataFromServer()
    }
    
    func setTableView(){
        myPlaceTableView.delegate = self
        myPlaceTableView.dataSource = self
        myPlaceTableView.tableFooterView = UIView()
        myPlaceTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func setUserImageView() {
        self.userImageView.layer.cornerRadius = 24
    }
    
    func setBackButton() {
        self.backButton.isUserInteractionEnabled = true
    }
    
    func getDataFromServer() {
        MyPlaceService.shared.getMyPlaceList() {
            result in
            switch result{
            case .success(let successData):
                print("SUCCESS : ", successData)
                self.myPlaceList = successData.data
                
            case .failure(let failureData):
                print("FAILURE : ", failureData)
            }
        }
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

extension MyInfoVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = self.myPlaceList {
            if list.count < 3 {
                return 3
            }else{
                return list.count
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlaceTableViewCell") as! MyPlaceTableViewCell
        
        if let list = self.myPlaceList{
            if list.count < 3 {
                switch indexPath.row {
                case 0:
                    cell.placeNameLabel.text = "집 주소"
                    cell.placeAddressLabel.text = list[indexPath.row].address
                case 1:
                    cell.placeNameLabel.text = "직장 주소"
                    cell.placeAddressLabel.text = list[indexPath.row].address
                default :
                    cell.placeNameLabel.text = "기타"
                    cell.placeAddressLabel.text = "없음"
                    cell.placeAddressLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
                }
            }else{
                switch indexPath.row {
                case 0:
                    cell.placeNameLabel.text = "집 주소"
                    cell.placeAddressLabel.text = list[indexPath.row].address
                case 1:
                    cell.placeNameLabel.text = "직장 주소"
                    cell.placeAddressLabel.text = list[indexPath.row].address
                default :
                    cell.placeNameLabel.text = list[indexPath.row].name
                    cell.placeAddressLabel.text = list[indexPath.row].address
                }
            }
        }
        return cell
    }
    
    
}
