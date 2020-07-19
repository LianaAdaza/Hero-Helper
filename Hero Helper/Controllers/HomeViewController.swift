//
//  HomeViewController.swift
//  Hero Helper
//
//  Created by Liana Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var userSelectedState: UILabel!
    @IBOutlet weak var hospitalPicker: UIPickerView!
    @IBOutlet weak var userselectedHospital: UILabel! {
        didSet {
            userselectedHospital.adjustsFontSizeToFitWidth = true
        }
    }
    
    let allStates = StatesDB.sharedInstance
    var states: [State] = []
    var selectedState: State?
    var hospitals = [Hospital]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return states.count
        }
        return hospitals.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return "\(states[row].stateName) (\(states[row].stateAbbreviation))"
        }
        return hospitals[row].NAME
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            userSelectedState.text = states[row].stateName
//            getHospitalsInState(state: states[row].stateAbbreviation)
//            hospitalPicker.isHidden = false
            hospitalPicker.reloadAllComponents()
        }
        userselectedHospital.text = hospitals[row].NAME
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        hospitalPicker.dataSource = self
        hospitalPicker.delegate = self
        
        states = allStates.getStates()
//        hospitalPicker.isHidden = true
        getHospitals()
    }
    
    func getHospitals() {
        guard let url = URL(string:
            "https://services1.arcgis.com/Hp6G80Pky0om7QvQ/arcgis/rest/services/Hospitals_1/FeatureServer/0/query?where=1%3D1&outFields=NAME,STATE&returnGeometry=false&returnDistinctValues=true&outSR=&f=json") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()

                do {
                    let allHospitals = try decoder.decode(Hospitals.self, from: data)
                    self.hospitals = allHospitals.features
                } catch {
                    print(error)
                }
            }
        }
        
        task.resume()
    }
    
    func getHospitalsInState(state: String) {
        guard let url = URL(string: "https://services1.arcgis.com/Hp6G80Pky0om7QvQ/arcgis/rest/services/Hospitals_1/FeatureServer/0/query?where=STATE%20%3D%20'\(state)'&outFields=NAME,STATE&returnGeometry=false&outSR=4326&f=json") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                self.hospitals = self.parseJsonData(data: data)
            }
        }
        
        task.resume()
    }
    
    func parseJsonData(data: Data) -> [Hospital] {
        var sHospitals = [Hospital]()
        let decoder = JSONDecoder()

        do {
            let stateHospitals = try decoder.decode(Hospitals.self, from: data)
            sHospitals = stateHospitals.features
            print(sHospitals[0])
        } catch {
            print(error)
        }
        
        return sHospitals
    }
}
