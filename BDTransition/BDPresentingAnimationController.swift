//
//  BDPresentingAnimationController.swift
//  BDViewController
//
//  Created by Daniel Vebman on 7/4/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

/// Presenting animation controller
class BDPresentingAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let presentedViewController = transitionContext.viewController(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(presentedViewController.view)
        
        let finalFrameForPresentedView = transitionContext.finalFrame(for: presentedViewController)
        presentedViewController.view.frame = finalFrameForPresentedView
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveEaseOut,
            animations: { }
        ) { finished in
            transitionContext.completeTransition(finished)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.45
    }    
}
