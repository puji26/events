//
//  HomePresenter.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit
class HomePresenter : ViewToHomePresenterProtocol {
    
    var view: PresenterToHomeViewController?
    
    var interactor: PresenterToHomeInteractorProtocol?
    
    var router: PresenterToHomeRouterProtocol?
    
    func loadDataEvent() {
        interactor?.loadDataEvent()
    }
    
    func loadDataMenu() {
        interactor?.loadDataMenu()
    }
    
    func showScreenCreateEvent(menu: MenuList,navigationController: UINavigationController) {
        router?.pushScreenCreate(menu: menu, navigationController: navigationController)
    }
    
}
extension HomePresenter : InteractorToHomePresenterProtocol {
    func loadDataUpComing(event: Event?) {
        view?.dataUpcoming(event: event)
    }
    
    func loadDataEvent(eventArr: [Event]) {
        view?.dataEvents(event: eventArr)
    }
    
    func loadDatamenu(menuArr: [MenuList]) {
        view?.dataMenu(menu: menuArr)
    }
    
    
}

