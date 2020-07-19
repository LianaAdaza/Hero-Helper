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
    var legend = Legend.sharedInstance
    var keys: [Key] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keys = legend.getKeys()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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

}
