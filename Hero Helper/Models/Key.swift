//
//  Key.swift
//  Hero Helper
//
//  Created by Leila Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class Key: NSObject {
    var image: UIImage
    var title: String
    var desc: String
    
    init(image: UIImage, title: String, desc: String) {
        self.image = image
        self.title = title
        self.desc = desc
    }
}

final class Legend {
    static let sharedInstance = Legend ()
    
    private var keys: [Key] = [
        Key(image: UIImage(named: "Imminent Red")!, title: "Stock outage imminent\n< 7 days stock on hand", desc: "Conservation measures may apply (if replenishment is uncertain) and ONLY if conservation training has occurred."),
        Key(image: UIImage(named: "Imminent Orange")!, title: "Stock outage imminent\n7 to 14 days stock on hand", desc: "Conservation measures may apply (if replenishment is uncertain) and ONLY if conservation training has occurred."),
        Key(image: UIImage(named: "Concern Yellow")!, title: "Stock outage concern exists\n15 to 30 days stock on hand", desc: "Conservation measures may apply if replenishment, unmet need/demand or usage variation concerns exist and ONLY if conservation training has occurred."),
        Key(image: UIImage(named: "Concern Green")!, title: "Stock outage concern exists\n> 30 days stock on hand", desc: "Conservation measures may apply if replenishment, unmet need/demand or usage variation concerns exist and ONLY if conservation training has occurred."),
        Key(image: UIImage(named: "Normal")!, title: "Normal operations\n> 30 days stock on hand", desc: "No conservation measures needed. No replenishment, unmet need/demand or usage variation concerns exist.")
    ]
    
    private init () {
        // Prevent unauthorized initialization
    }
    
    func numOfKeys () -> Int {
        return keys.count
    }
    
    func getKeys () -> [Key] {
        return keys
    }
}
