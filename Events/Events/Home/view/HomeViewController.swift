//
//  HomeViewController.swift
//  Events
//
//  Created by Puji Wahono on 05/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit
import CoreData

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
    
    // MARK: - Array Home Menu
    var arrHome = [MenuList]()
    
    // MARK: - Array Event Up Coming
    var arrEvent = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        presentor?.loadDataMenu()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setStatusBar(backgroundColor: #colorLiteral(red: 1, green: 0.4517489672, blue: 0, alpha: 1))
        self.navigationController?.navigationBar.barStyle = .black
        presentor?.loadDataEvent()
        
    }
    
    
    
    // MARK: - Setting UI Home
    func setupUI(){
        //Setting Back Button
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        //Setting TableView Event
        tableEventTerbaru.delegate = self
        tableEventTerbaru.dataSource = self
        tableEventTerbaru.tableFooterView = UIView.init(frame: .zero)
        
        //Setting CollectionView Home menu
        collectionMenu.dataSource = self
        collectionMenu.delegate = self
        collectionMenu.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        
        //Setting Collection View Home menu Shadow
        collectionMenu.layer.masksToBounds = true
        collectionMenu.layer.borderWidth = 2.0
        collectionMenu.layer.borderColor = UIColor.systemGray5.cgColor
        collectionMenu.layer.cornerRadius = CGFloat(10)
        collectionMenu.layer.shadowOffset = CGSize(width: 0, height: 2)
        collectionMenu.layer.shadowOpacity = 0.5
        collectionMenu.layer.shadowRadius = 5
        collectionMenu.layer.shadowColor = UIColor.systemGray5.cgColor
        collectionMenu.layer.shadowPath = UIBezierPath(rect: collectionMenu.bounds).cgPath
        collectionMenu.layer.shouldRasterize = true
        collectionMenu.layer.rasterizationScale = UIScreen.main.scale
        
        //Setting Collection View Home menu Layout
        let flowLayout = UICollectionViewFlowLayout()
        let sizeWidht = (((self.collectionMenu.frame.width) / 4)  - 25)
        let sizeHeight = CGFloat((self.collectionMenu.frame.height / 2) - 6)
        flowLayout.itemSize = CGSize(width: sizeWidht, height: sizeHeight)
        collectionMenu.setCollectionViewLayout(flowLayout, animated: true)
    }
    
}
extension HomeViewController : PresenterToHomeViewController {
    func dataUpcoming(event: Event?) {
        if event != nil {
            guard let event = event else {
                
                return
            }
            self.imgEventUpComing.image = UIImage.init(data: event.gambar)
            self.lblNameEvent.text = event.nama
            self.lblLokasiEvent.text = event.lokasi
            let date = DateTimeService.dateConvertUpComing(dateFromServer: event.tanggalDari)
            self.lblDate.text = date?.Date
            self.lblMonth.text = date?.Month
        } else {
            self.imgEventUpComing.isHidden = true
            self.lblNameEvent.isHidden = true
            self.lblLokasiEvent.isHidden = true
            self.lblDate.isHidden = true
            self.lblMonth.isHidden = true
        }
    }
    
    // MARK: - Get Data Menu
    func dataMenu(menu: [MenuList]) {
        self.arrHome = menu
        DispatchQueue.main.async {
            self.collectionMenu.reloadData()
        }
    }
    // MARK: - Get Data Events
    func dataEvents(event: [Event]) {
        print(event)
        if event.isEmpty {
            self.viewEventUpComing.isHidden = true
            self.viewTitleEventTerbaru.isHidden = true
            self.tableEventTerbaru.isHidden = true
        } else {
            self.viewEventUpComing.isHidden = false
            self.viewTitleEventTerbaru.isHidden = false
            self.tableEventTerbaru.isHidden = false
            
            self.arrEvent = event
            DispatchQueue.main.async {
                self.tableEventTerbaru.reloadData()
            }
        }
    }
}

extension HomeViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrHome.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        let menu = arrHome[indexPath.row]
        cell.setup(item: menu)
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.buttonTap = { [unowned self] in
            guard let navigationController = self.navigationController else {return}
            self.presentor?.showScreenCreateEvent(menu: menu, navigationController: navigationController)
        }
        return cell
    }
}

extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEvent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "ListEventTableViewCell", bundle: nil), forCellReuseIdentifier: "ListEventCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListEventCell", for: indexPath) as! ListEventTableViewCell
        let event = arrEvent[indexPath.row]
        cell.setup(item: event)
        return cell
    }
    
    
    
}

