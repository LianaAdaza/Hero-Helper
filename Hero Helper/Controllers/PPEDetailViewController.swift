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
    var itemsList = ItemsList.sharedInstance
    var items: [ItemDetails] = []
    var index: Int? {
        didSet {
            guard let index = index else { return }
            items = itemsList.getAll(index: index)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemDetailsCell", for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.itemName.text = item.name
        cell.itemDesc.text = item.desc
        cell.itemImage.image = item.image
    
        return cell
    }
}
