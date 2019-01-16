//
//  CameraRouter.swift
//  CloudDocScanner
//
//  Created by Gurcan Yavuz on 16.01.2019.
//  Copyright © 2019 Madduck. All rights reserved.
//

import UIKit

protocol CameraRoutingLogic {
    func showEditImageScreen(image: UIImage)
}

protocol CameraDataPassing {
    
}

class CameraRouter: NSObject, CameraRoutingLogic, CameraDataPassing {
    weak var viewController: CameraController?

    init(viewController: CameraController) {
        self.viewController = viewController
    }
    
    func showEditImageScreen(image: UIImage) {
        
        let vc = UIStoryboard(name: "Edit", bundle: nil).instantiateViewController(withIdentifier: "EditImageController") as! EditImageController
        
        vc.image = image
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

}
