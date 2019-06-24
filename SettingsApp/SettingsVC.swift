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
        
    }

    @IBAction func didSlideCoolMeter(_ sender: UISlider) {
        
        let wholeNumber = Int(sender.value)
        coolMeterLabel.text = String(wholeNumber)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 2 else { return }
        print("save")
    }
    
}
