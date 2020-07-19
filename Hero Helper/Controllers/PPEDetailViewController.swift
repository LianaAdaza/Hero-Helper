//
//  PPEDetailViewController.swift
//  Hero Helper
//
//  Created by Liana Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class PPEDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detailsTableView: UITableView!
    var allItems = ItemsList.sharedInstance
    var item: [ItemDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        item = allItems.getRespirators()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemdetailsCell", for: indexPath) as! ItemTableViewCell
        
        let items = allItems.getRespirators()[indexPath.row]
        cell.itemName.text = items.name
        cell.itemDesc.text = items.desc
        cell.itemImage.image = items.image
    
        return cell
    }
}
