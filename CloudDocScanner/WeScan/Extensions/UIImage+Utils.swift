//
//  UIImage+Utils.swift
//  WeScan
//
//  Created by Bobo on 5/25/18.
//  Copyright © 2018 WeTransfer. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    func isEqual(to image: UIImage) -> Bool {
        guard let data1: Data = self.pngData(),
            let data2: Data = image.pngData() else {
                return false
        }
        return data1.elementsEqual(data2)
    }
    
    func scaledImage(atPoint point: CGPoint, scaleFactor: CGFloat, targetSize size: CGSize) -> UIImage? {
        guard let cgImage = self.cgImage else {
            return nil
        }
        
        let scaledSize = CGSize(width: size.width / scaleFactor, height: size.height / scaleFactor)
        
        guard let croppedImage = cgImage.cropping(to: CGRect(x: point.x - scaledSize.width / 2.0, y: point.y - scaledSize.height / 2.0, width: scaledSize.width, height: scaledSize.height)) else {
            return nil
        }
        
        return UIImage(cgImage: croppedImage)
    }
    
   
}
