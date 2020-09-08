//
//  ProtocolsLogin.swift
//  Events
//
//  Created by Puji Wahono on 05/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//
import Foundation
import UIKit

protocol ViewToLoginPresenterProtocol : class {
    var view : PresenterToLoginViewController? {get set}
    var interactor : PresenterToLoginInteractorProtocol? {get set}
    var router : PresenterToLoginRouterProtocol? {get set}
    
    func postLogin(username:String,password:String)
    func showScreenHome(navigationController:UIViewController)
}

protocol PresenterToLoginViewController : class {
    func successLogin()
    func showError(error:String)
}

protocol PresenterToLoginRouterProtocol : class {
    static func createModuleLogin() -> LoginViewController
    func presentScreenHome(navigationController:UIViewController)
}

protocol PresenterToLoginInteractorProtocol : class {
    var presenter :InteractorToLoginPresenterProtocol? {get set}
    func postLogin(username:String,password:String)
       
}

protocol InteractorToLoginPresenterProtocol : class {
    func successLogin()
    func errorLogin(error:String)
}

