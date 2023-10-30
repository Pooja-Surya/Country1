//
//  CountryViewController.swift
//  Country
//
//  Created by C S Pooja on 27/10/23.

import Foundation
import UIKit

protocol CountrySelectionDelegate {
    func didSelectCountry(image: UIImage, name: String)
}




class CountryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var delegate: CountrySelectionDelegate?

    var countryData: CountryDataModel?
    let countryDataArray: [(text: String, myImage: String)] = [
        ("Jordan", "Jordan"),
        ("Egypt", "egypt"),
        ("Palestine", "Palestine"),
        ("Labanon", "lebanon"),
        ("Qatar","qatarnew"),
        ("UAE ","uaenew"),
        ("Algeria","algerianew")
    ]
   
   
    @IBOutlet weak var tableView: UITableView!
    
    
    //close button
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Choose Your Country"
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "CountrySelectionCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier:  "CountrySelectionCell")
    }

    //ROWS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryDataArray.count
    }
    //For each cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountrySelectionCell", for: indexPath) as? CountrySelectionCell
        let (text, myImage) = countryDataArray[indexPath.row]
        cell?.myCountry.text = text
        cell?.myCountryImage.image = UIImage(named: myImage)
        cell?.myCountryImage.layer.cornerRadius = cell!.myCountryImage.frame.size.height / 2
       cell?.myCountryView.layer.cornerRadius = cell!.myCountryView.frame.height / 2
        cell?.myCountryImage.layer.borderWidth = 0.25
        cell?.myCountryImage.layer.masksToBounds = true
        cell?.clipsToBounds = true
        
        return cell ?? UITableViewCell()
    }
    
    
    //selection of a row
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CountrySelectionCell{
            cell.countryTick.isHidden = true
        }
    }
    //tick
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CountrySelectionCell{
            cell.countryTick.isHidden = false
            if let cell = tableView.cellForRow(at: indexPath) as? CountrySelectionCell {
                if let image = cell.myCountryImage.image, let name = cell.myCountry.text {
                    // Call the delegate method to pass the selected image and name
                    delegate?.didSelectCountry(image: image, name: name)
                }
            }
            
        }
        
    }
 


    
}
