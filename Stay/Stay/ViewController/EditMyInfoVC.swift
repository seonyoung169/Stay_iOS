//
//  EditMyInfoVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/29.
//

import UIKit

class EditMyInfoVC: UIViewController {
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeAddressArea: UIView!
    @IBOutlet weak var homeAddressLabel: UILabel!
    @IBOutlet weak var workAddressArea: UIView!
    @IBOutlet weak var workAddressLabel: UILabel!
    @IBOutlet weak var theOtherClassArea: UIView!
    @IBOutlet weak var theOtherClass: UITextField!
    @IBOutlet weak var theOtherAdressArea: UIView!
    
    @IBOutlet weak var assignArea: UIView!
    
    private let picker = UIPickerView()
    
    let classes = ["학교", "독서실", "알바", "본가"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageView()
        setBackgroundBox()
        setTapGesture()
        setClassPickerView()
    }
    
    func setImageView() {
        profileImageView.layer.cornerRadius = 24
        assignArea.layer.cornerRadius = 10
        backButton.isUserInteractionEnabled = true
        
        // MARK : 아래쪽 화살표 에셋 추가 필요
        let downArrow = UIImageView(image: UIImage(named: "icRightArrow"))
        self.theOtherClass.rightView = downArrow
        self.theOtherClass.rightViewMode = .always
    }
    
    func setBackgroundBox() {
        homeAddressArea.layer.cornerRadius = 8
        homeAddressArea.layer.borderWidth = 0.5
        homeAddressArea.layer.borderColor = CGColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        workAddressArea.layer.cornerRadius = 8
        workAddressArea.layer.borderWidth = 0.5
        workAddressArea.layer.borderColor = CGColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        theOtherClassArea.layer.cornerRadius = 8
        theOtherClassArea.layer.borderWidth = 0.5
        theOtherClassArea.layer.borderColor = CGColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        theOtherAdressArea.layer.cornerRadius = 8
        theOtherAdressArea.layer.borderWidth = 0.5
        theOtherAdressArea.layer.borderColor = CGColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTapGesture() {
        let addressTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAddress(sender:)))
        
        self.theOtherAdressArea.addGestureRecognizer(addressTapGesture)
    }
    
    @objc func tapAddress(sender : UIGestureRecognizer){
        if let vc = self.storyboard?.instantiateViewController(identifier: "AddressSearchVC"){
            self.present(vc, animated: true, completion: nil)
        }else{
            print("AddressSearchVC nil")
        }
    }
    
    func setClassPickerView() {
        picker.delegate = self
        
        theOtherClass.backgroundColor = .clear
        theOtherClass.borderStyle = .none
        theOtherClass.tintColor = .clear
        theOtherClass.inputView = picker
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(selectClass))
        
        toolBar.setItems([flexibleSpace, button], animated: true)
        toolBar.isUserInteractionEnabled = true
        theOtherClass.inputAccessoryView = toolBar
    }
    
    @objc func selectClass() {
        self.theOtherClass.endEditing(true)
    }

}

extension EditMyInfoVC : UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.classes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.classes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        theOtherClass.text = classes[row]
    }
}
