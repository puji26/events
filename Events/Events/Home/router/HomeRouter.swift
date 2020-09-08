//
//  HomeRouter.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter : PresenterToHomeRouterProtocol {
    
    static func createModuleHome() -> HomeViewController {
        let view = HomeViewController()
        let presenter : ViewToHomePresenterProtocol & InteractorToHomePresenterProtocol = HomePresenter()
        let interactor : PresenterToHomeInteractorProtocol = HomeInteractor()
        let router : PresenterToHomeRouterProtocol = HomeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushScreenCreate(menu: MenuList, navigationController: UINavigationController) {
        if menu.name == "Buat Event" {
            let createEventScreen = CreateRouter.createModuleCreate()
            navigationController.pushViewController(createEventScreen, animated: true)
        }
    }
    
    
    
}
