//
//  MyPlaceTableViewCell.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/12.
//

import UIKit

class MyPlaceTableViewCell: UITableViewCell {
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
