//
//  FriendTableViewCell.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/11.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var rankImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImage.layer.cornerRadius = 14
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
