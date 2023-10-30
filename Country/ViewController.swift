//
//  ViewController.swift
//  Country
//
//  Created by C S Pooja on 26/10/23.
//

import UIKit

class ViewController: UIViewController, CountrySelectionDelegate {
    
    @IBOutlet weak var selectedCountryImage: UIImageView!
    
    @IBOutlet weak var selectedCountryName: UILabel!
    
    
    var selectedIdentifier: String?
    
    func didSelectCountry(image: UIImage, name: String)
    {
        selectedCountryImage.image = image
        selectedCountryImage.layer.cornerRadius = selectedCountryImage.frame.size.height / 2
//      selectedCountryImage.clipsToBounds = true
        selectedCountryImage.layer.borderWidth = 0.25
        selectedCountryImage.layer.masksToBounds = true
        selectedCountryName.text = name
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCountryImage.layer.cornerRadius = selectedCountryImage.frame.width / 2
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let countryVC = segue.destination as? CountryViewController {
            countryVC.delegate = self
        }
        
    }
    
    
}

