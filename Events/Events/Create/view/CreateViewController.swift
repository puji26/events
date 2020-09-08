//
//  CreateViewController.swift
//  Events
//
//  Created by Puji Wahono on 06/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    @IBAction func btnSelanjutnyaDidPressed(_ sender: Any) {
        self.createEvent()
    }
    
    private func createEvent(){
        let namaEvent = lblNamaEvent.text ?? ""
        let lokasiEvent = lblLokasiEvent.text ?? ""
        let deskripsiEvent = txtDeskripsiEvent.text ?? ""
        let penyelenggaraEvent = lblPenyelenggaraEvent.text ?? ""
        let tanggalDari = lblTanggalDari.text ?? ""
        let pukulDari = lblPukulDari.text ?? ""
        let tglDari = tanggalDari + " " + pukulDari
        let tanggalHingga = lblTanggalHingga.text ?? ""
        let pukulHingga = lblPukulHingga.text ?? ""
        let tglHingga = tanggalHingga + " " + pukulHingga
        guard let gambar = imgGambar.image?.pngData() else {
            self.checkEmptyData()
            return  }
        
        if namaEvent == "" || lokasiEvent == "" || deskripsiEvent == "" || penyelenggaraEvent == "" || tanggalDari == "" || pukulDari == "" || tanggalHingga == "" || pukulHingga == "" {
            self.checkEmptyData()
        } else {
            let eventCreate = Event(nama: namaEvent, lokasi: lokasiEvent, deskripsi: deskripsiEvent, penyelenggara: penyelenggaraEvent, tanggalDari: tglDari, tanggalHingga: tglHingga, gambar: gambar)
            presentor?.postCreateEvent(event: eventCreate)
           
        }
        
    }
    
    private func checkEmptyData(){
        self.showAlertError(title: "", message: "Please input your data!")
    }
    
    private func setupUI(){
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title = "Buat Event"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.setStatusBar(backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    @IBAction func tapImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
    }
    
    @IBAction func tapTanggalDari(_ sender: Any) {
        let calendar = DatePickerViewController()
        calendar.timeOrDate = false
        calendar.completion = { date in
            self.lblTanggalDari.text = date
            
        }
        present(calendar, animated: true)
        
    }
    
    @IBAction func tapPukulDari(_ sender: Any) {
        let calendar = DatePickerViewController()
        calendar.timeOrDate = true
        calendar.completion = { date in
            self.lblPukulDari.text = date
            
        }
        present(calendar, animated: true)
        
    }
    
    @IBAction func tapTanggalHingga(_ sender: Any) {
        let calendar = DatePickerViewController()
        calendar.timeOrDate = false
        calendar.completion = { date in
            
            self.lblTanggalHingga.text = date
        }
        present(calendar, animated: true)
        
    }
    
    @IBAction func tapPukulHingga(_ sender: Any) {
        let calendar = DatePickerViewController()
        calendar.timeOrDate = true
        calendar.completion = { date in
            self.lblPukulHingga.text = date
        }
        present(calendar, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
        imgGambar.image = userPickedImage
        picker.dismiss(animated: true)
    }
    
}

extension CreateViewController : PresenterToCreateViewController {
    
    func successCreateEvent() {
       self.showCustomAlert(title: "Success", message: "Event has been created", operation: self.backToHome)
    }
    
    func showError(error: String) {
       self.showCustomAlert(title: "Error", message: error, operation: self.backToHome)
    }
    
    func backToHome(){
        guard let navigationController = self.navigationController else {return}
        self.presentor?.backToHome(navigationController: navigationController)
    }
    
    
    
    
}
