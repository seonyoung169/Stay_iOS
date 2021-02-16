//
//  AddressSearchVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/04.
//

import UIKit

class AddressSearchVC: UIViewController {

    @IBOutlet weak var closeButton: UIImageView!
    @IBOutlet weak var writeAddressArea: UIView!
    @IBOutlet weak var writeAddressField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddressSearchVC - viewDidLoad")
        setView()
        setTapGesture()
    }
    
    func setTapGesture() {
        let closeButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCloseButton(sender:)))
        self.closeButton.addGestureRecognizer(closeButtonTapGesture)
    }
    
    @objc func tapCloseButton(sender : UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    }
    
    func setView() {
        print("AddressSearchVC - setView")
        writeAddressField.delegate = self
        
        closeButton.isUserInteractionEnabled = true
        
        writeAddressArea.layer.cornerRadius = 8
        writeAddressArea.layer.borderWidth = 0.5
        writeAddressArea.layer.borderColor = CGColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        writeAddressField.backgroundColor = .clear
        writeAddressField.borderStyle = .none
        writeAddressField.tintColor = .black
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? AddressResultVC else { return }

        if let keyword = self.writeAddressField.text {
            resultVC.keyword = keyword
        }
    }
    

}

extension AddressSearchVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        performSegue(withIdentifier: "showAddressResult", sender: nil)
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        writeAddressField.placeholder = ""
        writeAddressField.clearsOnBeginEditing = true
    }
    
}
