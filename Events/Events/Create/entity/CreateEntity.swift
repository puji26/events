//
//  CreateEntity.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CreateEntity {
    static func createEvent(nama:String,lokasi:String,deskripsi:String,gambar:UIImage,tanggalDari:String,tanggalHingga:String,penyelenggara:String){
        // refer to Appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        // create a context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // entity for new record
        guard let eventsEntity = NSEntityDescription.entity(forEntityName: "Events", in:managedContext) else { return  }
        
        // add data
        let events = NSManagedObject(entity:eventsEntity, insertInto: managedContext)
        events.setValue(nama, forKey: "nama")
        events.setValue(lokasi, forKey: "lokasi")
        events.setValue(gambar, forKey: "gambar")
        events.setValue(tanggalDari, forKey: "tanggalDari")
        events.setValue(tanggalHingga, forKey: "tanggalHingga")
        events.setValue(penyelenggara, forKey: "penyelenggara")
        do{
            try managedContext.save()
        }catch let error as NSError{
            print(error)
        }
    }
}

