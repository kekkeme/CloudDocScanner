//
//  ScanManager.swift
//  CloudDocScanner
//
//  Created by Gurcan Yavuz on 16.01.2019.
//  Copyright © 2019 Madduck. All rights reserved.
//

import Foundation

class ScanManager {
    
    // MARK: - Properties
    
    static let shared = ScanManager()
    
    public var detecting = true
    public var scanning = true
    // MARK: -
    
    private init() {
        //To make this singleton make private init
        
    }
    
}
