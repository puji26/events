//
//  HomeInteractor.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class HomeInteractor : PresenterToHomeInteractorProtocol {
    
    var presenter: InteractorToHomePresenterProtocol?
    
    func loadDataEvent() {
        self.loadData()
    }
    
    func loadDataMenu() {
        let BuatEvent = MenuList(name: "Buat Event", image: UIImage.init(named: "addEvent"))
        let EventSaya = MenuList(name: "Event Saya", image: UIImage.init(named: "myEvent"))
        let DaftarKaryawan = MenuList(name: "Daftar Karyawan", image: UIImage.init(named: "account"))
        let ReservasiMeeting = MenuList(name: "Reservasi Meeting", image: UIImage.init(named: "meeting"))
        let PengajuanCuti = MenuList(name: "Pengajuan Cuti", image: UIImage.init(named: "date"))
        let Absensi = MenuList(name: "Absensi", image: UIImage.init(named: "alarm"))
        
        self.presenter?.loadDatamenu(menuArr: [BuatEvent , EventSaya , DaftarKaryawan , ReservasiMeeting , PengajuanCuti , Absensi])
        
    }
    
    typealias eventsHandler = (_ event:[Event]? ) -> Void
    
    func loadData(){
        
        // refer to Appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        // create a context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // fetch data
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Events")
        
        do{
            
            var arrEvents = [Event]()
            arrEvents.removeAll()
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            for i in 0 ..< result.count  {
                let nama =  result[i].value(forKey: "nama") as? String ?? ""
                let lokasi = result[i].value(forKey: "lokasi") as? String ?? ""
                let deskripsi = result[i].value(forKey: "deskripsi") as? String ?? ""
                let penyelenggara = result[i].value(forKey: "penyelenggara") as? String ?? ""
                let tanggalDari = result[i].value(forKey: "tanggalDari") as? String ?? ""
                let tanggalHingga = result[i].value(forKey: "tanggalDari") as? String ?? ""
                let gambar = result[i].value(forKey: "gambar") as! Data
                
                let events = Event(nama: nama, lokasi: lokasi, deskripsi: deskripsi, penyelenggara: penyelenggara, tanggalDari : tanggalDari, tanggalHingga:tanggalHingga , gambar: gambar)
                arrEvents.append(events)
            }
            self.eventUpComing(event: arrEvents)
            self.presenter?.loadDataEvent(eventArr: arrEvents)
            
        }catch let error {
            print(error)
        }
        
    }
    
    func eventUpComing(event:[Event]){
        let date = Date()
        let filter = event.filter({$0.date ?? date > date})
        var arrFilter = [Event]()
        arrFilter = filter
        if arrFilter.count > 1 {
            let sortedUsersCheckIn = arrFilter.sorted { (date1, date2) -> Bool in
                       return (date1.date!) < (date2.date!)
                   }
                   if !sortedUsersCheckIn.isEmpty{
                       self.presenter?.loadDataUpComing(event: sortedUsersCheckIn[0])
                   } else {
                       self.presenter?.loadDataUpComing(event:nil)
                   }
        } else {
             self.presenter?.loadDataUpComing(event: arrFilter[0])
        }
       
        
    }
    
    
    
    
    
    
    
    
}

