//
//  EntityPresenter.swift
//  Events
//
//  Created by Puji Wahono on 04/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation


struct Login {
    var username : String
    var password : String
    
    init(username:String, password:String) {
        self.username = username
        self.password = password
    }
    
    func loginAction() -> Bool {
        if username == "user" && password == "12345" {
            return true
        } else {
            return false
        }
    }
}
