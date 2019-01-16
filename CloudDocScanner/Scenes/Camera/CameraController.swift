//
//  CameraController.swift
//  CloudDocScanner
//
//  Created by Gurcan Yavuz on 16.01.2019.
//  Copyright © 2019 Madduck. All rights reserved.
//

import UIKit

protocol CameraDisplayLogic: class {
    func showLibrary()
    func showEditImageScreen(image: UIImage)
}

class CameraController: UIViewController {
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var cameraWrapperView: UIView!
    @IBOutlet weak var cameraPermissionLabel: UILabel!
    
    var interactor: CameraBusinessLogic?
    var router: (NSObjectProtocol & CameraRoutingLogic & CameraDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        
        let presenter = CameraPresenter(viewController: self)
        let interactor = CameraInteractor(presenter: presenter)
        self.interactor = interactor
        router = CameraRouter(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        cameraButton.layer.cornerRadius = 23
        cameraWrapperView.layer.borderColor = UIColor.white.cgColor
        cameraWrapperView.layer.cornerRadius = 26
        cameraWrapperView.layer.borderWidth = 1
        let gesture = UITapGestureRecognizer(target: self, action: #selector(allowAccessCamera))
        
        cameraPermissionLabel.addGestureRecognizer(gesture)
        
    }
    
    
    @IBAction func libraryButtonPressed(_ sender: Any) {
        interactor?.showLibraryPressed()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        
    }
    
    
    @objc func allowAccessCamera() {
        UIApplication.shared.openURL(URL(string: UIApplication.openSettingsURLString)!)
    }
}


extension CameraController: CameraDisplayLogic {
    func showLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func showEditImageScreen(image: UIImage) {
        router?.showEditImageScreen(image: image)
    }
}

extension CameraController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        interactor?.imageSelected(image: image)
        //interactor?.imageScannedWithQuad(image, quad: nil)
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated:true, completion: nil)
    }
}
