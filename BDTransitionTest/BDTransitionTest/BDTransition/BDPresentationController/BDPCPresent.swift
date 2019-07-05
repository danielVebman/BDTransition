//
//  BDPCPresent.swift
//  BDViewController
//
//  Created by Daniel Vebman on 7/4/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

extension BDPresentationController {
    /// Run presentation transition animation
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView, let window = containerView.window else { return }
        
        updateSnapshot()
        snapshotViewContainer.frame = containerView.bounds
        window.addSubview(snapshotViewContainer)
        
        gradeView.backgroundColor = presentedView?.backgroundColor ?? UIColor.black
        containerView.addSubview(gradeView)
        constrain(view: gradeView, to: containerView)
        
        snapshotView?.layer.cornerRadius = 0
        snapshotView?.layer.masksToBounds = true
        
        if animateCornerRadius {
            addCornerRadiusAnimation(for: snapshotView, cornerRadius: cornerRadius, duration: 0.6)
        } else {
            snapshotView?.layer.cornerRadius = cornerRadius
        }
        
        presentedViewController.transitionCoordinator?.animate(
            alongsideTransition: { [weak self] context in
                self?.snapshotViewContainer.transform = self?.identityTransformForSnapshot ?? .identity
            }, completion: { _ in }
        )
    }
    
    /// Setup gestures when presentation ends
    override func presentationTransitionDidEnd(_ completed: Bool) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        pan.delegate = self
        pan.maximumNumberOfTouches = 1
        pan.cancelsTouchesInView = false
        snapshotViewContainer.addGestureRecognizer(pan)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(handleTap))
        tap.cancelsTouchesInView = false
        snapshotViewContainer.addGestureRecognizer(tap)
    }
}
