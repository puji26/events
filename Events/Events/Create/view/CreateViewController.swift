//
//  CreateViewController.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var lblNamaEvent: UITextField!
    @IBOutlet weak var lblLokasiEvent: UITextField!
    @IBOutlet weak var lblTanggalDari: UITextField!
    @IBOutlet weak var lblPukulDari: UITextField!
    @IBOutlet weak var lblTanggalHingga: UITextField!
    @IBOutlet weak var lblPukulHingga: UITextField!
    @IBOutlet weak var imgGambar: UIImageView!
    @IBOutlet weak var txtDeskripsiEvent: UITextField!
    @IBOutlet weak var lblPenyelenggaraEvent: UITextField!
    
    
  var presentor : ViewToCreatePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CreateViewController : PresenterToCreateViewController {
    
    
    
}
