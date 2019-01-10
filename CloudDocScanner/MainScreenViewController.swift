//
//  MainScreenViewController.swift
//  CloudDocScanner
//
//  Created by Sercan Yavuz on 6.01.2019.
//  Copyright © 2019 Madduck. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == recentTableView {
            return recents.count
        } else if tableView == allScansTableView {
            if all.count % 2 == 0 {
                return all.count / 2
            } else {
                return (all.count / 2) + 1
            }
            
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == recentTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myIdentifier") as! RecentTableView
            cell.pdfNameLabel.text = recents[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "allScanIdentifier") as! AllScanTableView
            cell.allScanPdfNameLabel.text = all[indexPath.row*2]
            
            let myInt: Int = ((indexPath.row)*2)+1
            let count = all.count
            if myInt > (count-1) {
                cell.allScanPdfNameLabel2.text = ""
            } else {
                cell.allScanPdfNameLabel2.text = all[myInt]
            }
            
            
            // Indexpath.row -- [0]: 1, [1]: 2
            // 0 ---> [0], [1]
            // 1 ---> [2], [3]
            // 2 ---> [4], [5]
            // x ---> [2x], [2x+1]
            
            return cell
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recentTableView.delegate = self
        recentTableView.dataSource = self
        allScansTableView.delegate = self
        allScansTableView.dataSource = self
    }
    
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var recentTableView: UITableView!
    @IBOutlet weak var camera: UIButton!
    @IBOutlet weak var allScansTableView: UITableView!
    @IBOutlet weak var settings: UIBarButtonItem!
    var recents = ["PDF", "PDF2", "PDF3", "PDF4"]
    var all = ["1", "2", "3", "4", "5"]
    
    
    @IBAction func cameraPushed() {
    
    }
    
    @IBAction func recentPushed() {

        greenView.isHidden = true
        redView.isHidden = false
        
    }
    
    @IBAction func allScansPushed() {
    
        redView.isHidden = true
        greenView.isHidden = false
    }
    
    @IBAction func settingsPushed(_ sender: Any) {
        
        
    }
    
    
}


