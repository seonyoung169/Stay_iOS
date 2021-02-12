//
//  AddressResultTableViewCell.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/07.
//

import UIKit

class AddressResultTableViewCell: UITableViewCell {

    @IBOutlet weak var newAddressTag: UIView!
    @IBOutlet weak var oldAddressTag: UIView!
    @IBOutlet weak var newAddressLabel: UILabel!
    @IBOutlet weak var oldAddressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTagView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setTagView() {
        newAddressTag.layer.cornerRadius = 8
        oldAddressTag.layer.cornerRadius = 8
    }

}
