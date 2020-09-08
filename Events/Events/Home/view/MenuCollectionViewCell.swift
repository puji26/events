//
//  MenuCollectionViewCell.swift
//  Events
//
//  Created by Puji Wahono on 07/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var lblMenu: UILabel!
    
    var buttonTap : (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnMenuDidPressed(_ sender: Any) {
        self.buttonTap?()
    }
    
    func setup(item:MenuList){
        let image = item.image?.withRenderingMode(.alwaysTemplate)
        btnMenu.setImage(image, for: .normal)
        btnMenu.tintColor = UIColor.init(named: "Primary")
        lblMenu.text = item.name
        
    }

}
