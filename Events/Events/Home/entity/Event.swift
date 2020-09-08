//
//  Event.swift
//  Events
//
//  Created by Puji Wahono on 04/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct Event {
    var nama : String
    var lokasi : String
    var deskripsi : String
    var penyelenggara : String
    var tanggalDari : String
    var tanggalHingga : String
    var gambar : Data
    
    var imageGambar : UIImage? {
        return UIImage.init(data: gambar) 
    }
    
    var date : Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        guard let dateTimeData = dateFormatter.date(from: tanggalDari) else {return nil}
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.timeZone = TimeZone.current
        
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        dateFormatterPrint.timeZone = TimeZone.current
        dateFormatterPrint.locale = Locale.current
        let time  = dateFormatterPrint.string(from: dateTimeData)
        
        let dateFormatterdate = DateFormatter()
        
        dateFormatterdate.dateFormat = "yyyy-MM-dd"
        let date = dateFormatterdate.date(from: time)
        
        return date
    }
    
    init( nama : String , lokasi : String , deskripsi : String , penyelenggara : String , tanggalDari : String, tanggalHingga:String  ,gambar : Data) {
        self.nama = nama
        self.lokasi = lokasi
        self.deskripsi = deskripsi
        self.penyelenggara = penyelenggara
        self.tanggalDari = tanggalDari
        self.tanggalHingga = tanggalHingga
        self.gambar = gambar
    }
    
}

class loadEvent {
    
}
