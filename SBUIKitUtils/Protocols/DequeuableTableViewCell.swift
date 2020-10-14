//
//  DequeuableTableViewCell.swift
//  SBUIKitUtils
//
//  Created by Steve Barnegren on 24/07/2018.
//  Copyright © 2018 Steve Barnegren. All rights reserved.
//

import Foundation
import UIKit

public protocol DequeuableTableViewCell: class {
    static var nibName: String? {get}
}

fileprivate extension DequeuableTableViewCell {
    @nonobjc static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public extension UITableView {
    
    func register<T: DequeuableTableViewCell>(dequeuableCellType: T.Type) {
        
        if let nibName = dequeuableCellType.nibName {
            let nib = UINib(nibName: nibName, bundle: nil)
            register(nib, forCellReuseIdentifier: dequeuableCellType.reuseIdentifier)
        } else {
            register(dequeuableCellType, forCellReuseIdentifier: dequeuableCellType.reuseIdentifier)
        }
    }
    
    func dequeue<T: DequeuableTableViewCell>(dequeableCellType: T.Type, indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withIdentifier: dequeableCellType.reuseIdentifier) as? T else {
            fatalError("Unable to dequeue cell")
        }
        return cell
    }
}
