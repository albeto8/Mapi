//
//  FlagCell.swift
//  Mapi
//
//  Created by Mavi on 13/11/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

class FlagCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    
    
    func configureCell(_ country: Country) {
        
        countryLabel.text = country.name
        flagImageView.image = UIImage(named : country.alphaCode.lowercased())
    }
}
