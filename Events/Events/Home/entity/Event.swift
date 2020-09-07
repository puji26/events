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
    typealias eventsHandler = (_ event:[Event]? ) -> Void
    static func loadData(completion : @escaping (eventsHandler)){
        
        // refer to Appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        // create a context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // fetch data
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Events") 
        
        do{
            var arrEvents = [Event]()
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            
            for i in 0 ..< result.count{
                let nama =  result[i].value(forKey: "nama") as? String ?? ""
                let lokasi = result[i].value(forKey: "lokasi") as? String ?? ""
                let deskripsi = result[i].value(forKey: "deskripsi") as? String ?? ""
                let penyelenggara = result[i].value(forKey: "penyelenggara") as? String ?? ""
                let tanggalDari = result[i].value(forKey: "tanggalDari") as? String ?? ""
                let tanggalHingga = result[i].value(forKey: "tanggalDari") as? String ?? ""
                let gambar = result[i].value(forKey: "tanggalDari") as! Data
                
                let events = Event(nama: nama, lokasi: lokasi, deskripsi: deskripsi, penyelenggara: penyelenggara, tanggalDari : tanggalDari, tanggalHingga:tanggalHingga , gambar: gambar)
                arrEvents.append(events)
            }
            
            completion(arrEvents)
            
        }catch let error {
            print(error)
        }
        
    }
    
}
