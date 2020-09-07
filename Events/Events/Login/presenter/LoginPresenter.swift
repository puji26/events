//
//  LoginPresenter.swift
//  Events
//
//  Created by Puji Wahono on 04/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit
class LoginPresenter : ViewToLoginPresenterProtocol {
   
    
    var view: PresenterToLoginViewController?
    
    var interactor: PresenterToLoginInteractorProtocol?
    
    var router: PresenterToLoginRouterProtocol?
    
    func postLogin(username: String, password: String) {
        interactor?.postLogin(username: username, password: password)
    }
    
    func showScreenHome(navigationController: UIViewController) {
        router?.presentScreenHome(navigationController: navigationController)
       }
       
       
    
}
extension LoginPresenter : InteractorToLoginPresenterProtocol {
    func successLogin() {
        self.view?.successLogin()
    }
    
    func errorLogin(error: String) {
        self.view?.showError(error: error)
    }
    
    
}
