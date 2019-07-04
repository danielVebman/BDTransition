//
//  BDDismissingAnimationController.swift
//  BDViewController
//
//  Created by Daniel Vebman on 7/4/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

/// Dismissing animation controller
class BDDismissingAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveEaseIn,
            animations: { }
        ) { finished in
            transitionContext.completeTransition(finished)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.45
    }
}
