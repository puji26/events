//
//  DatePickerViewController.swift
//  Events
//
//  Created by Puji Wahono on 07/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var viewDatePicker: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var timeeLabel: UILabel!
    
    typealias completionHendler = (_ date:String) -> Void
    var completion: completionHendler?
    
    let dateFormatter = DateFormatter()
    var dateSelected: String?
    var date: String?
    var timeOrDate : Bool? = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        datePicker.locale = Locale(identifier: "en_GB")
        datePicker.isSelected = true
        
        if timeOrDate == true {
              datePicker.datePickerMode = .time
        } else {
            datePicker.datePickerMode = .date
        }
       
        
        let date = Date()
        let dateFormat = DateFormatter()
        
        if timeOrDate == true {
                      dateFormat.dateFormat = "HH:mm"
               } else {
                  dateFormat.dateFormat = "dd-MM-yyyy"
               }
      
        dateFormat.locale = Locale(identifier: "en_US_POSIX")
        let datePickerSelected =  dateFormat.string(from:date)
        self.dateSelected = datePickerSelected
        
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
        if timeOrDate == true {
             self.dateFormatter.dateFormat = "HH:mm"
        } else {
             self.dateFormatter.dateFormat = "dd-MM-yyyy"
        }
       
        self.date = dateFormatter.string(from: datePicker.date)
        self.dismiss(animated: true) {
            guard let date = self.date else { return }
            guard let completionBlock = self.completion else { return }
            completionBlock(date)
        }
        
    }
    
    
    
}
