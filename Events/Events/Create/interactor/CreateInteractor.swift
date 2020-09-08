//
//  CreateInteractor.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation


class CreateInteractor : PresenterToCreateInteractorProtocol {
    
    var presenter: InteractorToCreatePresenterProtocol?
    
    func postCreateEvent(event: Event) {
        CreateEntity.createEvent(event: event) { (success, error) in
          
            if error != nil {
                self.presenter?.showError(error: error ?? "")
            } else {
                self.presenter?.successCreateEvent()
            }
        }
        
    }
}
