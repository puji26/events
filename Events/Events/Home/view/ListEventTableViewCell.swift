//
//  ListEventTableViewCell.swift
//  Events
//
//  Created by Puji Wahono on 07/09/20.
//  Copyright © 2020 Puji Wahono. All rights reserved.
//

import UIKit

class ListEventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblTanggal: UILabel!
    @IBOutlet weak var lblLokasi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(item:Event) {
        imgEvent.image = item.imageGambar
        lblNama.text = item.nama
        let date = DateTimeService.dateConvert(dateFromServer: item.tanggalDari)
        lblTanggal.text = date
        lblLokasi.text = item.lokasi
    }
    
}
