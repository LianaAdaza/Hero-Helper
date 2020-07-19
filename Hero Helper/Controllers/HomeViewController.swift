//
//  HomeViewController.swift
//  Hero Helper
//
//  Created by Liana Adaza on 7/18/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var statePicker: UIPickerView!
    
    let allStates = StatesDB.sharedInstance
    var states: [State] = []
    var selectedState: State?
    var hospitals = [Hospital]()
    
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
        selectedState = states[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        
        states = allStates.getStates()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
            case "showLogin":
                guard let destination = segue.destination as? LoginViewController else { return }
                destination.state = selectedState
            default:
                print("unexpected segue identifier")
        }
    }
}
