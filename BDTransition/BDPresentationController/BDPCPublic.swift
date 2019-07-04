//
//  BDPCPublic.swift
//  BDViewController
//
//  Created by Daniel Vebman on 7/4/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

extension BDPresentationController {
    /// update presenting controller snapshot
    func updatePresentingController() {
        if isDismissing { return }
        updateSnapshot()
    }
    
    /// update the current height of the controller
    func updateHeight(_ newHeight: CGFloat) {
        guard let containerView = containerView else { return }
        
        UIView.animate(
            withDuration: 0.45,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: [.curveEaseOut, .allowUserInteraction],
            animations: {
                self.presentedView?.frame.origin.y = containerView.frame.height - newHeight
                self.presentedView?.frame.size.height = newHeight
                self.snapshotViewContainer.transform = CGAffineTransform(translationX: 0, y: -newHeight)
            }
        ) { _ in
            self.height = newHeight
        }
    }
}
