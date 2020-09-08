//
//  CreatePresenter.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation
import UIKit

class CreatePresenter : ViewToCreatePresenterProtocol {
   
    var view: PresenterToCreateViewController?
    
    var interactor: PresenterToCreateInteractorProtocol?
    
    var router: PresenterToCreateRouterProtocol?
    
    func postCreateEvent(event: Event) {
        interactor?.postCreateEvent(event: event)
    }
    
    func backToHome(navigationController: UINavigationController) {
        router?.backToHome(navigationController: navigationController)
       }
    
}
extension CreatePresenter : InteractorToCreatePresenterProtocol {
    func successCreateEvent() {
        view?.successCreateEvent()
    }
    
    func showError(error: String) {
        
    }
    
    
}

