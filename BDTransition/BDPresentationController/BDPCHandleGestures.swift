//
//  BDPCHandleGestures.swift
//  BDViewController
//
//  Created by Daniel Vebman on 7/4/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

extension BDPresentationController {
    /// Handle pan gesture
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            presentingViewController.view.layer.removeAllAnimations()
            presentingViewController.view.endEditing(true)
            presentedViewController.view.endEditing(true)
            gesture.setTranslation(CGPoint(x: 0, y: 0), in: containerView)
        case .changed:
            let translation = gesture.translation(in: snapshotViewContainer).y
            if translation >= 0 {
                let frictionLength = translation
                let frictionTranslation = 30 * atan(frictionLength / 120) + frictionLength / 10
                snapshotViewContainer.transform = identityTransformForSnapshot.translatedBy(x: 0, y: frictionTranslation)
            } else {
                snapshotViewContainer.transform = identityTransformForSnapshot
            }
        case .ended:
            let translation = gesture.translation(in: presentedView).y
            if translation >= 100 {
                presentedViewController.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(
                    withDuration: 0.6,
                    delay: 0,
                    usingSpringWithDamping: 1,
                    initialSpringVelocity: 1,
                    options: [.curveEaseOut, .allowUserInteraction],
                    animations: {
                        self.snapshotViewContainer.transform = self.identityTransformForSnapshot
                    }
                )
            }
        default:
            break
        }
    }
    
    /// Handle tap gesture
    @objc func handleTap() {
        presentingViewController.view.endEditing(true)
        presentedViewController.view.endEditing(true)
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
