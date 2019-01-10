//
//  SettingsScreenViewController.swift
//  CloudDocScanner
//
//  Created by Sercan Yavuz on 6.01.2019.
//  Copyright © 2019 Madduck. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView
        return cell
    }
    
    @IBOutlet weak var settingsTableView: UITableView!
    
    
    override func viewDidLoad() {
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        super.viewDidLoad()
    }
    
    
}

