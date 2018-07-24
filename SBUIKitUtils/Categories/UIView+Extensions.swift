//
//  UIView+Extensions.swift
//  SBUIKitUtils
//
//  Created by Steve Barnegren on 15/07/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public func sendToBack() {
        superview?.sendSubview(toBack: self)
    }
    
    public func bringToFront() {
        superview?.bringSubview(toFront: self)
    }
}
