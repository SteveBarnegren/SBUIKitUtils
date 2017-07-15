//
//  DelegatingButton.swift
//  SBUIKitUtils
//
//  Created by Steve Barnegren on 15/07/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation
import UIKit

public class SBDelegatingButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        
        self.addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        self.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
    }
    
    // MARK: - Properties
    
    public var touchDownHandler: () -> () = {}
    public var touchUpInsideHandler: () -> () = {}
    public var touchUpOutsideHandler: () -> () = {}
    public var didHighlightHandler: () -> () = {}
    public var didUnhighlightHandler: () -> () = {}
    
    override public var isHighlighted: Bool {
        didSet{
            if isHighlighted != oldValue {
                highlightChanged()
            }
        }
    }
    
    // MARK: - Actions
    
    @objc private func touchDown() {
        //print("Touch down inside")
        touchDownHandler()
    }
    
    @objc private func touchUpInside() {
        //print("Touch up inside")
        touchUpInsideHandler()
    }
    
    @objc private func touchUpOutside() {
        //print("Touch up outside")
        touchUpOutsideHandler()
    }
    
    @objc private func highlightChanged(){
        //print("Highlight changed")
        isHighlighted ? didHighlightHandler() : didUnhighlightHandler()
    }
    
}
