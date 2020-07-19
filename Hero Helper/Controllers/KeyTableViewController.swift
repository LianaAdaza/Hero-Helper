//
//  KeyTableViewController.swift
//  Hero Helper
//
//  Created by Leila Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class KeyTableViewController: UITableViewController {
    
    @IBOutlet var keysTableView: UITableView!
    var previousVC: UIViewController?
    var allSupplies = DashboardList.sharedInstance
    var supply: Supply?
    var legend = Legend.sharedInstance
    var keys: [Key] = []
    var updatedStatus: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keys = legend.getKeys()
        
        guard let supply = supply else { return }
        if previousVC is PPEUpdateViewController {
            title = "Update \(supply.title) Stock"
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if previousVC is PPEUpdateViewController {
           return nil
        }
        return "Legend"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = keysTableView.dequeueReusableCell(withIdentifier: "keyCell", for: indexPath) as? KeyTableViewCell else { return UITableViewCell() }
        
        let key = keys[indexPath.row]
        cell.keyTitle.text = key.title
        cell.keyDescription.text = key.desc
        cell.keyImageView.image = key.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if previousVC is PPEUpdateViewController {
            let key = keys[indexPath.row]
            updatedStatus = key.image
            
            for sup in allSupplies.getSupplies() {
                if sup == supply {
                    sup.image = updatedStatus ?? sup.image
                    print(sup.title)
                }
            }
            
            navigationController?.popViewController(animated: true)
        }
    }
}
