//
//  HomeProtocols.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation

protocol ViewToHomePresenterProtocol : class {
    var view : PresenterToHomeViewController? {get set}
    var interactor : PresenterToHomeInteractorProtocol? {get set}
    var router : PresenterToHomeRouterProtocol? {get set}
    
    func loadDataEvent()
//    func postLogin(username:String,password:String)
//    func showScreenHome(navigationController:UINavigationController)
}

protocol PresenterToHomeViewController : class {
//    func successLogin()
//    func showError(error:String)
    func dataEvents(event:[Event])
}

protocol PresenterToHomeRouterProtocol : class {
    static func createModuleHome() -> HomeViewController
//    func pesentScreenHome(navigationController:UINavigationController)
}

protocol PresenterToHomeInteractorProtocol : class {
    var presenter :InteractorToHomePresenterProtocol? {get set}
//    func postLogin(username:String,password:String)
        func loadDataEvent()
}

protocol InteractorToHomePresenterProtocol : class {
//    func successLogin()
//    func errorLogin(error:String)
    
    func loadDataEvent(eventArr:[Event])
}


