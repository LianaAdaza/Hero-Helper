//
//  Dashboard.swift
//  Hero Helper
//
//  Created by Liana Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class Supply: NSObject {
    var title: String = ""
    var image: UIImage
    
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
}

final class DashboardList {
    static let sharedInstance = DashboardList ()
    
    private init () {
        
    }
    
    var supplies: [Supply] = [
        Supply(title: "Respirators", image: UIImage(named: "Concern Yellow")!),
        Supply(title: "Masks", image: UIImage(named: "Concern Green")!),
        Supply(title: "Gloves", image: UIImage(named: "Concern Green")!),
        Supply(title: "Facial Protection", image: UIImage(named: "Concern Green")!),
        Supply(title: "Gowns", image: UIImage(named: "Concern Green")!),
        Supply(title: "Gloves", image: UIImage(named: "Concern Green")!)
    ]
    
    func getSupplies() -> [Supply] {
        return supplies
    }
}
