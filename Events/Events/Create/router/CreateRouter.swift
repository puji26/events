//
//  CreateRouter.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation


class CreateRouter : PresenterToCreateRouterProtocol {
    static func createModuleCreate() -> CreateViewController {
        let view = CreateViewController()
        let presenter : ViewToCreatePresenterProtocol & InteractorToCreatePresenterProtocol = CreatePresenter()
        let interactor : PresenterToCreateInteractorProtocol = CreateInteractor()
        let router : PresenterToCreateRouterProtocol = CreateRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    
}
