//
//  CGRect+Extensions.swift
//  SBUIKitUtils
//
//  Created by Steve Barnegren on 15/07/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation
import UIKit

public extension CGRect {
    
    public var shortestSide: CGFloat {
        return min(bounds.size.width, bounds.size.height)
    }
    
    public var longestSide: CGFloat {
        return max(bounds.size.width, bounds.size.height)
    }
    
    public var bounds: CGRect {
        return CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    public var aspectFittingSquare: CGRect {
        
        let shortSide = min(size.width, size.height)
        
        return CGRect(x: origin.x + size.width/2 - shortSide/2,
                      y: origin.y + size.height/2 - shortSide/2,
                      width: shortSide,
                      height: shortSide)
    }
    
    public var aspectFillingSquare: CGRect {
        
        let longSide = max(size.width, size.height)
        
        return CGRect(x: origin.x + size.width/2 - longSide/2,
                      y: origin.y + size.height/2 - longSide/2,
                      width: longSide,
                      height: longSide)
    }
}
