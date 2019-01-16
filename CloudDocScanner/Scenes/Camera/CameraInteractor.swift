//
//  CameraInteractor.swift
//  CloudDocScanner
//
//  Created by Gurcan Yavuz on 16.01.2019.
//  Copyright © 2019 Madduck. All rights reserved.
//

import UIKit

protocol CameraBusinessLogic {
    func showLibraryPressed()
    func imageSelected(image: UIImage)
}

class CameraInteractor: CameraBusinessLogic {

    
    
    var presenter: CameraPresentationLogic!
    
    init(presenter: CameraPresentationLogic) {
        self.presenter = presenter
    }
    
    func showLibraryPressed() {
        presenter.showLibrary()
    }

    func imageSelected(image: UIImage) {
        presenter.showEditImageScreen(image: image)
    }
}


