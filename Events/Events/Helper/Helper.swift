//
//  Helper.swift
//  Events
//
//  Created by Puji Wahono on 07/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showCustomAlert(title: String, message: String,operation: @escaping ()->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "OK", style: .default) { (action) in
            operation()
        }
        alert.view.tintColor = UIColor.init(named: "Primary")
        alert.addAction(alertAction1)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertError(title: String, message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        alert.view.tintColor = UIColor.init(named: "Primary")
        alert.addAction(alertAction1)
        present(alert, animated: true, completion: nil)
    }
    
    
}

class DateTimeService {
    static func dateConvert(dateFromServer:String) -> (String)? {
        let dateFormatter = DateFormatter()
        
        let dateFormat = "dd-MM-yyyy HH:mm"
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let dateTimeData = dateFormatter.date(from: dateFromServer) else {return nil}
        
        dateFormatter.dateFormat = "dd MMMM, HH:mm a"
        let dateSlashString = dateFormatter.string(from: dateTimeData)
        
        return (dateSlashString)
    }
    
    static func dateConvertUpComing(dateFromServer:String) -> (Month:String,Date:String)? {
        let dateFormatter = DateFormatter()
        
        let dateFormat = "dd-MM-yyyy HH:mm"
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let dateTimeData = dateFormatter.date(from: dateFromServer) else {return nil}
        
        dateFormatter.dateFormat = "MMM"
        let dateSlashString = dateFormatter.string(from: dateTimeData)
        
        dateFormatter.dateFormat = "dd"
        let dateString = dateFormatter.string(from: dateTimeData)
        
        return (dateSlashString,dateString)
    }
    
    
}

