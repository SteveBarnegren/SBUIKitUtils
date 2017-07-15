//
//  SBOverlayActivityIndicatorViewController.swift
//  SBUIKitUtils
//
//  Created by Steve Barnegren on 15/07/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation
import UIKit

public class SBOverlayActivityIndicatorViewController: UIViewController {
    
    public static func overlayOnRootViewController() -> SBOverlayActivityIndicatorViewController {
        
        guard let rootViewController = UIApplication.shared.delegate?.window??.rootViewController else {
            fatalError("Unable to find root view controller")
        }
        
        return overlayOnViewController(rootViewController)
    }
    
    public static func overlayOnViewController(_ parentViewController: UIViewController) -> SBOverlayActivityIndicatorViewController {
        
        let activityViewController = SBOverlayActivityIndicatorViewController(nibName: nil, bundle: nil)
        
        parentViewController.addChildViewController(activityViewController)
        parentViewController.view.addSubview(activityViewController.view)
        
        activityViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        [NSLayoutAttribute.top, .bottom, .left, .right].forEach{
            let constraint = NSLayoutConstraint(item: activityViewController.view,
                                                attribute: $0,
                                                relatedBy: .equal,
                                                toItem: parentViewController.view,
                                                attribute: $0,
                                                multiplier: 1.0,
                                                constant: 0.0)
            parentViewController.view.addConstraint(constraint)
        }
        
        return activityViewController
    }
    
    // MARK: - Properties
    
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
    private var isFirstAppearance = true
    
    // MARK: - UIViewController
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Background
        view.backgroundColor = UIColor.clear
        
        // Activity Indicator
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        // Constraints
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = NSLayoutConstraint(item: activityIndicator,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0)
        
        let centerX = NSLayoutConstraint(item: activityIndicator,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0)
        
        view.addConstraints([centerX, centerY])
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isFirstAppearance {
            animateIn()
        }
        
        isFirstAppearance = false
    }
    
    // MARK: - Animation
    
    private func animateIn() {
        
        let alpha = CGFloat(0.6)
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.view.backgroundColor = UIColor(white: 0, alpha: alpha)
        }, completion: nil)
    }
    
    public func animateOutAndRemove() {
        
        activityIndicator.stopAnimating()
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: [.curveEaseInOut], animations: {
            self.view.backgroundColor = UIColor.clear
        }) { (finished) in
            self.removeFromParentViewController()
            self.view.removeFromSuperview()
        }
    }
    
}
