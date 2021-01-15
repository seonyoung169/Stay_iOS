//
//  CalendarCell.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/13.
//

import UIKit
import FSCalendar

class CalendarCell: FSCalendarCell {
    required init!(coder aDecoder: NSCoder!) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override init!(frame: CGRect) {
        super.init(frame: frame)
        let cellView = UIView(frame: self.bounds)
        self.backgroundView = cellView
    }
}
