//
//  AddressResultVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/07.
//

import UIKit

class AddressResultVC: UIViewController {

    @IBOutlet weak var closeButton: UIImageView!
    @IBOutlet weak var writeAddressArea: UIView!
    @IBOutlet weak var writeAddressField: UITextField!
    @IBOutlet weak var cancleTextField: UIImageView!
    @IBOutlet weak var addressResultTableView: UITableView!
    
    var addressList : [AddressData]! {
        didSet { self.addressResultTableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setTapGesture()
        getAddressDataFromServer()
    }
    
    func getAddressDataFromServer(){
        print("getting func")
        AddressService.shared.getAddressSearchResult(keyword: "성북") { result in
            switch result {
            case .success(let successData) :
                print("SUCCESS : ", successData)
                self.addressList = successData.results.juso
            case .failure(let failureData) :
                print("FAILURE : ", failureData)
            }
            
        }
    }
    
    func setView() {
        cancleTextField.isUserInteractionEnabled = true
        
        addressResultTableView.delegate = self
        addressResultTableView.dataSource = self
        addressResultTableView.tableFooterView = UIView()
        
        writeAddressField.backgroundColor = .clear
        writeAddressField.borderStyle = .none
        writeAddressField.tintColor = .clear
    }
    
    func setTapGesture() {
        let textFieldCancleGesture = UITapGestureRecognizer(target: self, action: #selector(tapCancleTextField(sender:)))
        
        cancleTextField.addGestureRecognizer(textFieldCancleGesture)
    }
    
    @objc func tapCancleTextField(sender : UITapGestureRecognizer){
        writeAddressField.text = ""
    }
}

extension AddressResultVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = self.addressList {
            return list.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressResultTableViewCell") as! AddressResultTableViewCell
        
        if let list = self.addressList {
            cell.newAddressLabel.text = list[indexPath.row].roadAddr
            cell.oldAddressLabel.text = list[indexPath.row].jibunAddr
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67
    }
    
}
