//
//  UIDevice+Extensions.swift
//  SBUIKitUtils
//
//  Created by Steve Barnegren on 18/07/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    
    // MARK: - Convinience checking of device
    
    public var isPad: Bool {
        return self.userInterfaceIdiom == .pad
    }
    
    public var isPhone: Bool {
        return self.userInterfaceIdiom == .phone
    }
    
    public var isTV: Bool {
        return self.userInterfaceIdiom == .tv
    }
}
