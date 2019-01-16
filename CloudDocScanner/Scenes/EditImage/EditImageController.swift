//
//  EditImageController.swift
//  CloudDocScanner
//
//  Created by Gurcan Yavuz on 16.01.2019.
//  Copyright © 2019 Madduck. All rights reserved.
//

import UIKit

class EditImageController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
}
