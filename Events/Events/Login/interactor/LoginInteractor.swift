//
//  LoginInteractor.swift
//  Events
//
//  Created by Puji Wahono on 04/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation

class LoginInteractor : PresenterToLoginInteractorProtocol {
    var presenter: InteractorToLoginPresenterProtocol?
    func postLogin(username: String, password: String) {
        print(username,password)
        let login = Login(username: username, password: password)
        if login.loginAction() {
            print(username,password)
            self.presenter?.successLogin()
        } else {
            self.presenter?.errorLogin(error: "username or password is wrong")
        }
    }
}
