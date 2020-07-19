//
//  ItemDetails.swift
//  Hero Helper
//
//  Created by Liana Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class ItemDetails: NSObject {
    var name: String = ""
    var desc: String = ""
    var image: UIImage
    
    init(name: String, desc: String, image: UIImage) {
        self.name = name
        self.desc = desc
        self.image = image
    }
}

final class ItemsList {
    static let sharedInstance = ItemsList ()
    
    private init () {
        
    }
    
    var respirators: [ItemDetails] = [
        ItemDetails(name: "N95 M 1870 Aura", desc: "(1) 3M is not sending replenishments\n(2) Continuing to conserve use of supplies (extended use and reuse where the appropriate and oNLY if training has occurred)", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "N95 Halyard Health", desc: "(1) Halyard supply replenishment continues to be favorable/strong", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "N95 Gerson 1730", desc: "(1) Working with Occupation Health to fit-test staff who are currently using 3M 1870 Aura who may be able to move to a Gerson 1730", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "N95 1860 - Regular", desc: "(1) Working with Occupation Health to fit-test staff who are currently using 3M 1870 Aura who may be able to move to an 1860 Regular", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "N95 1860 - Small", desc: "(1) Working with Occupation Health to fit-test staff who are currently using 3M 1870 Aura who may be able to move to an 1860 Small", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "P100 Respirator 3M or North", desc: "(1) Demand/need is believed to be beyond inventory on-hand\n(2) Pending prioritized roll-out for specific departments\n(3) Extend use of filters indefinitely until the point resistance is encountered with breathing normally", image: UIImage(named: "Concern Yellow")!),
        ItemDetails(name: "PAPR Maxair System", desc: "(1) Demand/Need for PAPR units is beyond inventory on hand\n(2) Continue to conserve use of supplies (reuse of PAPR lenses)", image: UIImage(named: "Concern Green")!)
    ]
    
    var masks: [ItemDetails] = [
        ItemDetails(name: "Ear Loop Procedure Mask", desc: "(1) Replenishment is strong however demand for mask use continues to increase as protocols evolve\n(2) Continue to conserve use of supplies (extended use)", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "Surgical Mask", desc: "(1) Replenishment is strong however demand for mask use is increasing as (restarting OR and Procedural cases)\n(2) Continue to conserve use of supplies where appropriate", image: UIImage(named: "Concern Green")!)
    ]
    
    var gloves: [ItemDetails] = [
        ItemDetails(name: "Non-Sterile Exam", desc: "(1) Malaysia manufacturers may be impacted by extension of country’s shelter in place order", image: UIImage(named: "Concern Green")!)
    ]
    
    var facialProtections: [ItemDetails] = [
        ItemDetails(name: "Face Shield", desc: "(1) Demand is uncertain and usage is increasing\n(2) Continue to conserve supplies (reuse protocol)", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "Nike Face Shield", desc: "(1) Demand is uncertain and usage is increasing\n(2) Continue to conserve supplies (reuse protocol)", image: UIImage(named: "Concern Green")!)
    ]
    
    var eyeProtections: [ItemDetails] = [
        ItemDetails(name: "Safety Goggles Sellstrom", desc: "(1) Continue to conserve supplies (reuse where possible\n(2) Supplier not meeting allocation targets", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "Safety Goggles Tidi Products", desc: "(1) Continue to conserve supplies (reuse where possible\n(2) Supplier not meeting allocation targets", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "Safety Goggles Kerma Medical", desc: "(1) Continue to conserve supplies (reuse where possible\n(2) Supplier not meeting allocation targets", image: UIImage(named: "Concern Green")!)
    ]
    
    var gowns: [ItemDetails] = [
        ItemDetails(name: "Isolation", desc: "(1) Raw material shortage globally\n(2) Continue to conserve use of supplies\n(3) Please order when necessary\n(4) Tie back may vary", image: UIImage(named: "Concern Green")!),
        ItemDetails(name: "Impervious", desc: "(1) Raw material shortage globally\n(2) Continue to conserve use of supplies", image: UIImage(named: "Concern Green")!)
    ]
    
    func getRespirators() -> [ItemDetails] {
        return respirators
    }
    
    func getMasks() -> [ItemDetails] {
        return masks
    }
    
    func getFacialProtections() -> [ItemDetails] {
        return facialProtections
    }
    
    func getEyeProtections() -> [ItemDetails] {
        return eyeProtections
    }
    
    func getGowns() -> [ItemDetails] {
        return gowns
    }
    
    func getGloves() -> [ItemDetails] {
        return gloves
    }
}
