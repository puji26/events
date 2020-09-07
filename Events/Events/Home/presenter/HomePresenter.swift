//
//  HomePresenter.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation

class HomePresenter : ViewToHomePresenterProtocol {
   
    var view: PresenterToHomeViewController?
    
    var interactor: PresenterToHomeInteractorProtocol?
    
    var router: PresenterToHomeRouterProtocol?
    
    func loadDataEvent() {
        interactor?.loadDataEvent()
       }
       
    
    
}
extension HomePresenter : InteractorToHomePresenterProtocol {
    func loadDataEvent(eventArr: [Event]) {
        view?.dataEvents(event: eventArr)
    }
    
    
}

