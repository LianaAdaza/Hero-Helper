//
//  LoginViewController.swift
//  Hero Helper
//
//  Created by Leila Adaza on 7/19/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var hospitalPicker: UIPickerView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var updateLogInBtn: UIButton!
    @IBOutlet weak var checkLogInBtn: UIButton!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var state: State? {
        didSet {
            guard let state = state else { return }
            title = state.stateName
            getHospitalsInState(state: state.stateAbbreviation)
        }
    }
    var hospitals = [Hospital]() {
        didSet {
            DispatchQueue.main.async {
                self.hospitalPicker.reloadAllComponents()
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField : UITextField) {
        showCorrectLoginBtn(user: textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hospitals.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hospitals[row].NAME
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hospitalPicker.dataSource = self
        hospitalPicker.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hospitalPicker.reloadAllComponents()
        usernameTextField.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    func getHospitalsInState(state: String) {
        guard let url = URL(string: "https://services1.arcgis.com/Hp6G80Pky0om7QvQ/arcgis/rest/services/Hospitals_1/FeatureServer/0/query?where=STATE%20%3D%20'\(state)'&outFields=NAME,STATE&returnGeometry=false&outSR=4326&f=json") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()

                do {
                    let stateHospitals = try decoder.decode(Hospitals.self, from: data)
                    self.hospitals = stateHospitals.features
                    self.hospitals.sort { $0.NAME < $1.NAME }
                } catch {
                   print(error)
                }
            }
        }
        
        task.resume()
    }
    
    func showCorrectLoginBtn(user: String) {
        if user == "admin" {
            checkLogInBtn.isEnabled = false
            updateLogInBtn.isEnabled = true
        } else {
            checkLogInBtn.isEnabled = true
            updateLogInBtn.isEnabled = false
        }
    }
    
    func showAlert() {
        let ac = UIAlertController(title: "The username/password fields cannot be empty.",
                                   message: "Please completely fill out both fields.",
                                   preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        ac.addAction(closeAction)
        
        present(ac, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if usernameTextField.text == "" || passwordTextField.text == "" {
            showAlert()
            return false
        }
        return true
    }
}
