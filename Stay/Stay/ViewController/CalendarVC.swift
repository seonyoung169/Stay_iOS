//
//  CalendarVC.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/01/10.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var backBtn: UIImageView!
    @IBOutlet weak var yearAndMonth: NSLayoutConstraint!
    @IBOutlet weak var currentCount: UILabel!
    @IBOutlet weak var bestCount: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackBtnTapGesture()
        setCalendar()
    }
    
    func setBackBtnTapGesture() -> Void {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.backBtn.addGestureRecognizer(gesture)
        self.backBtn.isUserInteractionEnabled = true
    }
    
    @objc func tap(sender : UIGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension CalendarVC : FSCalendarDelegate, FSCalendarDataSource {
    
    func setCalendar() -> Void {
        self.calendar.delegate = self
        self.calendar.dataSource = self
        
        self.calendar.locale = Locale(identifier: "ko_KR")
        self.calendar.appearance.weekdayTextColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        self.calendar.allowsSelection = false
        self.calendar.register(CalendarCell.self, forCellReuseIdentifier: "CalendarCell")
    }
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "CalendarCell", for: date, at: position) as! CalendarCell
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if(formatter.string(from : date) < formatter.string(from : Date())){
            cell.backgroundView = UIImageView(image: UIImage(named: "icStamp"))
            
            let len = Int ((calendar.frame.size.width / 7) * 0.66)
            print("len : ", len)
            cell.backgroundView?.frame = CGRect(x: 0, y: 0, width: len, height: len)
            
            cell.backgroundView?.translatesAutoresizingMaskIntoConstraints = false
            cell.backgroundView?.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            cell.backgroundView?.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true

        }
        
        return cell
    }
}
