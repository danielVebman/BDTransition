//
//  BDTransitioningDelegate.swift
//  BDViewController
//
//  Created by Daniel Vebman on 7/4/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

class BDTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    private var height: CGFloat
    
    init(height: CGFloat = 300) {
        self.height = height
        super.init()
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let controller = BDPresentationController(presentedViewController: presented, presenting: presenting)
        controller.height = self.height
        return controller
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BDPresentingAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BDDismissingAnimationController()
    }
}

