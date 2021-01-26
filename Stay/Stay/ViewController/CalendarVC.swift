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
    @IBOutlet weak var bestCount: UILabel!
    
    var recordAndStamp : CalendarData! {
        didSet {self.calendar.reloadData()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackBtnTapGesture()
        setCalendar()
        getDataFromServer()
    }
    
    // MARK : Getting Data from Server
    func getDataFromServer() {
        CalendarService.shared.getCalendarData() { result in
            switch result {
            case .success(let successData):
                print("SUCCESS : ", successData)
                self.recordAndStamp = successData.data
                self.setUserRecord()
            case .failure(let failureData):
                print("FAILURE : ", failureData)
            }
        }
    }
    
    func setUserRecord() {
        self.currentCount.text = "\(self.recordAndStamp.record.currentRecord)일"
        self.bestCount.text = "\(self.recordAndStamp.record.bestRecord)일"
    }
    
    // MARK : View Setting
    func setBackBtnTapGesture() -> Void {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.backBtn.addGestureRecognizer(gesture)
        self.backBtn.isUserInteractionEnabled = true
    }
    
    @objc func tap(sender : UIGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }
}


// MARK : Building Calendar
extension CalendarVC : FSCalendarDelegate, FSCalendarDataSource {
    
    func setCalendar() -> Void {
        self.calendar.delegate = self
        self.calendar.dataSource = self
        
        self.calendar.locale = Locale(identifier: "ko_KR")
        self.calendar.appearance.weekdayTextColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        self.calendar.allowsSelection = false
        self.calendar.today = nil
        
        self.calendar.register(CalendarCell.self, forCellReuseIdentifier: "CalendarCell")
    }
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        
        let cell = calendar.dequeueReusableCell(withIdentifier: "CalendarCell", for: date, at: position) as! CalendarCell
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "yyyy-MM"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let callLen = Int (calendar.frame.width / 7)
        let stampLen = Int(callLen * 2 / 3)
        
        let basicView = UIView(frame: CGRect(x: 0, y: 0, width: callLen, height: callLen))
        cell.backgroundView = basicView
        
        //this month
        if(monthFormatter.string(from: date) == monthFormatter.string(from: Date())){
            cell.backgroundView?.frame = CGRect(x: 0, y: 0, width: callLen, height: callLen)
            
            let line = UIView(frame: CGRect(x: 0, y: callLen-1, width: callLen, height: 1))
            
            line.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1 )
            basicView.addSubview(line)
            
            line.translatesAutoresizingMaskIntoConstraints = false
            line.leadingAnchor.constraint(equalTo: basicView.leadingAnchor).isActive = true
            line.trailingAnchor.constraint(equalTo: basicView.trailingAnchor).isActive = true
            line.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -2).isActive = true
            line.heightAnchor.constraint(equalToConstant: 1).isActive = true
            
            if(formatter.string(from : date) < formatter.string(from : Date())){
                
                guard let data = self.recordAndStamp else {
                    return cell
                }
                
                let dayFormatter = DateFormatter()
                dayFormatter.dateFormat = "d"
                let dayIndex : Int? = Int(dayFormatter.string(from: date))
                
                if let index : Int = dayIndex { // set stamp image
                    if(data.stamp[index-1].get){
                        let stamp = UIImageView(image: UIImage(named: "icStamp"))
                        stamp.frame = CGRect(x: 0, y: 0, width: stampLen, height: stampLen)
                        basicView.addSubview(stamp)
                        
                        stamp.translatesAutoresizingMaskIntoConstraints = false
                        stamp.centerXAnchor.constraint(equalTo: basicView.centerXAnchor).isActive = true
                        stamp.centerYAnchor.constraint(equalTo: basicView.centerYAnchor, constant: -3).isActive = true
                    }
                }
            }
        }
        
        return cell
    }
}
