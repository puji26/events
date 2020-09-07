//
//  CreatePresenter.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import Foundation


class CreatePresenter : ViewToCreatePresenterProtocol {
    var view: PresenterToCreateViewController?
    
    var interactor: PresenterToCreateInteractorProtocol?
    
    var router: PresenterToCreateRouterProtocol?
    
    
}
extension CreatePresenter : InteractorToCreatePresenterProtocol {
    
}

