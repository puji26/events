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
    
    // MARK: - Home To Presenter
   
    typealias eventsHandler = (_ success:Bool?,_ error:String? ) -> Void
    static func createEvent(event:Event,completion : @escaping (eventsHandler)){
        // refer to Appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
      
        // create a context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // entity for new record
         let eventsEntity = NSEntityDescription.entity(forEntityName: "Events", in:managedContext)
        
        // add data
        let events = NSManagedObject(entity:eventsEntity!, insertInto: managedContext)
        events.setValue(event.nama, forKey: "nama")
        events.setValue(event.lokasi, forKey: "lokasi")
        events.setValue(event.gambar, forKey: "gambar")
        events.setValue(event.tanggalDari, forKey: "tanggalDari")
        events.setValue(event.tanggalHingga, forKey: "tanggalHingga")
        events.setValue(event.penyelenggara, forKey: "penyelenggara")
        do{
            try managedContext.save()
            completion(true,nil)
            
        }catch let error as NSError{
            print(error)
            completion(nil,error.localizedDescription)
        }
    }
}

