//
//  PPEUpdateViewController.swift
//  Hero Helper
//
//  Created by Liana Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class PPEUpdateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var adminTableView: UITableView!
    var allSupplies = DashboardList.sharedInstance
    var supplies: [Supply] = []
    var selectedItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adminTableView.delegate = self
        adminTableView.dataSource = self
        supplies = allSupplies.getSupplies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        adminTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supplies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? DashboardTableViewCell else { return UITableViewCell() }
        
        let supply = allSupplies.getSupplies()[indexPath.row]
        itemCell.dashboardItem.text = supply.title
        itemCell.dashboardImage.image = supply.image
        
        return itemCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
            case "updateStatus":
                guard let indexPath = adminTableView.indexPathForSelectedRow, let destination = segue.destination as? KeyTableViewController else { return }
                let supply = supplies[indexPath.row]
                destination.previousVC = self
                destination.supply = supply
            default:
                print("unexpected segue identifier")
        }
    }
}
