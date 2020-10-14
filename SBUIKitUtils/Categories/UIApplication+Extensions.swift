//
//  UIApplication+Extensions.swift
//  SBUIKitUtils
//
//  Created by Steve Barnegren on 15/07/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    // MARK: - Get root view controller
    
    var rootViewController: UIViewController {
        return delegate!.window!!.rootViewController!
    }
}
