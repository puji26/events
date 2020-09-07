//
//  HomeViewController.swift
//  Events
//
//  Created by Puji Wahono on 05/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController  {
    // MARK: - View Profile
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblSalam: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
     // MARK: - View Menu
    @IBOutlet weak var collectionMenu: UICollectionView!
    
     // MARK: - View Event Up Coming
    @IBOutlet weak var viewEventUpComing: UIStackView!
    @IBOutlet weak var imgEventUpComing: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblNameEvent: UILabel!
    @IBOutlet weak var lblLokasiEvent: UILabel!
    
    // MARK: - View Event Up Coming
    @IBOutlet weak var viewTitleEventTerbaru: UIStackView!
    @IBOutlet weak var lblEventTerbaru: UITableView!
    @IBOutlet weak var tableEventTerbaru: UITableView!
    
    // MARK: - Home To Presenter
    var presentor : ViewToHomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presentor?.loadDataEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setStatusBar(backgroundColor: #colorLiteral(red: 1, green: 0.4517489672, blue: 0, alpha: 1))
        self.navigationController?.navigationBar.barStyle = .black
    }
    
}
extension HomeViewController : PresenterToHomeViewController {
    func dataEvents(event: [Event]) {
        if event.isEmpty {
            self.viewEventUpComing.isHidden = true
            self.viewTitleEventTerbaru.isHidden = true
            self.tableEventTerbaru.isHidden = true
        }
    }
}

