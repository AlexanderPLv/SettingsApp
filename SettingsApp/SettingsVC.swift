//
//  SettingsVC.swift
//  SettingsApp
//
//  Created by MacMini on 24/06/2019.
//  Copyright © 2019 com.blablabla. All rights reserved.
//

import UIKit

class SettingsVC: UITableViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var likesDevelopmentSwitch: UISwitch!
    @IBOutlet weak var coolMeterLabel: UILabel!
    @IBOutlet weak var coolMeterSlider: UISlider!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
    }
    
    private func saveSettings() {
        
        let settingsDictionary: [String : Any?] = ["firstName": firstNameTextField.text,
                                        "lastName": lastNameTextField.text,
                                        "likesDev": likesDevelopmentSwitch.isOn,
                                        "coolMeter": Int(coolMeterSlider.value)]
        
        UserDefaults.standard.set(settingsDictionary, forKey: "settings")
        
    }
    
    func loadSettings() {
        
        guard let settingsDictionary = UserDefaults.standard.dictionary(forKey: "settings") else { return }
        
        guard let firstName = settingsDictionary["firstName"] as? String,
        let lastName = settingsDictionary["lastName"] as? String,
        let likesDev = settingsDictionary["likesDev"] as? Bool,
        let coolMeter = settingsDictionary["coolMeter"] as? Int
            else { return }
        
        firstNameTextField.text = firstName
        lastNameTextField.text = lastName
        likesDevelopmentSwitch.isOn = likesDev
        coolMeterLabel.text = String(coolMeter)
        coolMeterSlider.value = Float(coolMeter)
        
    }
    

    @IBAction func didSlideCoolMeter(_ sender: UISlider) {
        
        let wholeNumber = Int(sender.value)
        coolMeterLabel.text = String(wholeNumber)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 2 else { return }
        saveSettings()
        didSaveAlert()
    }
    
    func didSaveAlert() {
        let alert = UIAlertController(title: "Settings saved", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
}
