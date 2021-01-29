//
//  NoticeTableViewCell.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/25.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
