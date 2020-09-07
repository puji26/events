//
//  LoginRouter.swift
//  Events
//
//  Created by Puji Wahono on 04/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter : PresenterToLoginRouterProtocol {
    static func createModuleLogin() -> LoginViewController {
        let view = LoginViewController()
        let presenter : ViewToLoginPresenterProtocol & InteractorToLoginPresenterProtocol = LoginPresenter()
        let interactor : PresenterToLoginInteractorProtocol = LoginInteractor()
        let router : PresenterToLoginRouterProtocol = LoginRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func presentScreenHome(navigationController: UIViewController) {
        let homeRouter = HomeRouter.createModuleHome()
        let nabBar = UINavigationController(rootViewController: homeRouter)
        nabBar.modalPresentationStyle = .fullScreen
        nabBar.navigationBar.barStyle = .default
       
        navigationController.present(nabBar, animated: true, completion: nil)
       }
    
    
}
