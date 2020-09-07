//
//  HomeInteractor.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation

class HomeInteractor : PresenterToHomeInteractorProtocol {
    
    
    var presenter: InteractorToHomePresenterProtocol?
    
    func loadDataEvent() {
        
        loadEvent.loadData { [weak self] (Event) in
            guard let self = self else {return}
            guard let Event = Event else {return}
            self.presenter?.loadDataEvent(eventArr: Event)
        }
        
    }
    
}

