//
//  CameraPresenter.swift
//  CloudDocScanner
//
//  Created by Gurcan Yavuz on 16.01.2019.
//  Copyright © 2019 Madduck. All rights reserved.
//

import UIKit

protocol CameraPresentationLogic {
    func showLibrary()
    func showEditImageScreen(image: UIImage)
}

class CameraPresenter: CameraPresentationLogic {
    
    weak var viewController: CameraDisplayLogic!
    
    init(viewController: CameraDisplayLogic) {
        self.viewController = viewController
    }

    
    func showLibrary() {
        viewController.showLibrary()
    }
    
    func showEditImageScreen(image: UIImage) {
        viewController.showEditImageScreen(image: image)
    }
    
}
