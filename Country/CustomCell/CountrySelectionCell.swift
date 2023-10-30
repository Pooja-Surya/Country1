//
//  CountrySelectionCell.swift
//  Country
//
//  Created by C S Pooja on 26/10/23.
//

import UIKit

class CountrySelectionCell: UITableViewCell {
  
    @IBOutlet weak var myCountryView: UIView!
    @IBOutlet weak var countryTick: UIImageView! {
        didSet{
            countryTick.isHidden = true
        }
    }
    @IBOutlet weak var myCountry: UILabel!
    @IBOutlet weak var myCountryImage: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        myCountryView?.layer.cornerRadius = 8
        myCountryView?.layer.borderWidth = 0.25
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        myCountryView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
//    }
    
}
