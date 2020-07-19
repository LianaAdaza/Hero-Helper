//
//  HomeViewController.swift
//  Hero Helper
//
//  Created by Liana Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

struct Hospital: Decodable {
    let NAME: String
}

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var userSelectedState: UILabel!
    @IBOutlet weak var hospitalPicker: UIPickerView!
    @IBOutlet weak var userselectedHospital: UILabel!
    
//    var selectedState = 0
    
// Hospital API
    var hospitals = [Hospital]()
    
 // State PickerView
    var allStates = StatesDB.sharedInstance
    var states: [State] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(states[row].stateName) (\(states[row].stateAbbreviation))"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userSelectedState.text = states[row].stateName
    }

// Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        hospitalPicker.dataSource = self
        hospitalPicker.delegate = self
        
        states = allStates.getStates()
        
        
//        let url = URL(string: "https://services1.arcgis.com/Hp6G80Pky0om7QvQ/arcgis/rest/services/Hospitals_1/FeatureServer/0/query?where=1%3D1&outFields=NAME,STATE&returnGeometry=false&returnDistinctValues=true&outSR=&f=json")
//
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if error == nil {
//                do {
//                    self.hospitals = try JSONDecoder().decode([Hospital].self, from: data!)
//                } catch {
//                    print("Parse Error")
//                }
//                print(self.hospitals.count)
//            }
//        }.resume()
    }
}
