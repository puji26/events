//
//  HomeProtocols.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToHomePresenterProtocol : class {
    var view : PresenterToHomeViewController? {get set}
    var interactor : PresenterToHomeInteractorProtocol? {get set}
    var router : PresenterToHomeRouterProtocol? {get set}
    
    func loadDataEvent()
    func loadDataMenu()
    func showScreenCreateEvent(menu:MenuList ,navigationController:UINavigationController)
}

protocol PresenterToHomeViewController : class {
    func dataUpcoming(event:Event?)
    func dataEvents(event:[Event])
    func dataMenu(menu:[MenuList])
}

protocol PresenterToHomeRouterProtocol : class {
static func createModuleHome() -> HomeViewController
   func pushScreenCreate(menu:MenuList,navigationController:UINavigationController)
}

protocol PresenterToHomeInteractorProtocol : class {
    var presenter :InteractorToHomePresenterProtocol? {get set}
    func loadDataEvent()
    func loadDataMenu()
}

protocol InteractorToHomePresenterProtocol : class {
    func loadDataEvent(eventArr:[Event])
    func loadDatamenu(menuArr:[MenuList])
    func loadDataUpComing(event:Event?)
}


