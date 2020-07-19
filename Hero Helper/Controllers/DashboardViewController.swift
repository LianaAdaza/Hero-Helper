//
//  DashboardViewController.swift
//  Hero Helper
//
//  Created by Liana Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dashboardTableView: UITableView!
    var allSupplies = DashboardList.sharedInstance
    var items: [Supply] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardTableView.delegate = self
        dashboardTableView.dataSource = self
        items = allSupplies.getSupplies()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! DashboardTableViewCell
        
        let item = allSupplies.getSupplies()[indexPath.row]
        itemCell.dashboardItem.text = item.title
        itemCell.dashboardImage.image = item.image
        
        return itemCell
    }
    
}
