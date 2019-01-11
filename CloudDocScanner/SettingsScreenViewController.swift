//
//  SettingsScreenViewController.swift
//  CloudDocScanner
//
//  Created by Sercan Yavuz on 6.01.2019.
//  Copyright © 2019 Madduck. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var preferences: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        preferences.isUserInteractionEnabled = true
        
        let preferencesPushed = UITapGestureRecognizer(target: self, action: #selector(self.preferencesPushed))
        preferences.addGestureRecognizer(preferencesPushed)
    }
    
    @objc func preferencesPushed() {
        let vc = PreferencesViewController()
        self.present(vc, animated: true, completion: nil)
    
    }
}

