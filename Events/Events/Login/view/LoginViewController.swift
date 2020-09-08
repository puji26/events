//
//  LoginViewController.swift
//  Events
//
//  Created by Puji Wahono on 04/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSandi: UITextField!
    
    var presentor : ViewToLoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let email = txtEmail.text ?? ""
        let sandi = txtSandi.text ?? ""
        presentor?.postLogin(username: email, password: sandi)
    }
}

extension LoginViewController : PresenterToLoginViewController {
    func successLogin() {
        self.presentor?.showScreenHome(navigationController: self)
    }
    
    func showError(error: String) {
        self.showAlertError(title: "Error", message: error)
    }
    
    
}
