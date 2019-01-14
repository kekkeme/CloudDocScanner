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

        let main = UIStoryboard(name: "Main", bundle: nil)
        let second = main.instantiateViewController(withIdentifier: "PreferencesViewController")
        self.navigationController?.pushViewController(second, animated: true)
        
        let backImage = UIImage(named: "leftR")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black //When I type black, it gives me the correct color. When I type RGB colors which is 158, 155, 155, it shows up as white. ASK!
        
    }
    
    @IBAction func dismissSettings(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

