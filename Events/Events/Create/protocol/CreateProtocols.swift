//
//  CreateProtocols.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToCreatePresenterProtocol : class {
    var view : PresenterToCreateViewController? {get set}
    var interactor : PresenterToCreateInteractorProtocol? {get set}
    var router : PresenterToCreateRouterProtocol? {get set}
    
    func postCreateEvent(event:Event)
      func backToHome(navigationController:UINavigationController)
    //    func postLogin(username:String,password:String)
    //    func showScreenHome(navigationController:UINavigationController)
}

protocol PresenterToCreateViewController : class {
    func successCreateEvent()
    func showError(error:String)
   
}

protocol PresenterToCreateRouterProtocol : class {
    static func createModuleCreate() -> CreateViewController
    func backToHome(navigationController:UINavigationController)
}

protocol PresenterToCreateInteractorProtocol : class {
    var presenter :InteractorToCreatePresenterProtocol? {get set}
    func postCreateEvent(event:Event)
  
}

protocol InteractorToCreatePresenterProtocol : class {
    func successCreateEvent()
    func showError(error:String)
}
