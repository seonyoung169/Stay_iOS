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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setTapGesture()
        getAddressData()
    }
    
    func getAddressData(){
        print("testtt")
        AddressService.shared.getAddressSearchResult(keyword: "성북") { result in
            switch result {
            case .success(let successData) :
                print(successData)
            case .failure(let failureData) :
                print(failureData)
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressResultTableViewCell") as! AddressResultTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67
    }
    
}
