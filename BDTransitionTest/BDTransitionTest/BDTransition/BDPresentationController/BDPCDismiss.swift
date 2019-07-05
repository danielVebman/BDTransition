//
//  BDPCDismiss.swift
//  BDViewController
//
//  Created by Daniel Vebman on 7/4/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

extension BDPresentationController {
    /// Run dismissal animation
    override func dismissalTransitionWillBegin() {
        isDismissing = true
        
        if animateCornerRadius {
            addCornerRadiusAnimation(for: snapshotView, cornerRadius: 0, duration: 0.6)
        } else {
            snapshotView?.layer.cornerRadius = cornerRadius
        }
        
        presentedViewController.transitionCoordinator?.animate(
            alongsideTransition: { [weak self] context in
                self?.snapshotViewContainer.transform = .identity
            }, completion: { _ in }
        )
    }
    
    /// Cleanup: remove snapshot and gradeView from original view controller
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        snapshotView?.removeFromSuperview()
        snapshotViewContainer.removeFromSuperview()
        gradeView.removeFromSuperview()
    }
}
