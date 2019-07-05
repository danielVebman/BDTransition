//
//  BDPresentationController.swift
//  BDViewController
//
//  Created by Daniel Vebman on 7/4/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

/// Presentation controller
class BDPresentationController: UIPresentationController, UIGestureRecognizerDelegate {
    /// The height of the presented view
    var height: CGFloat = 300
    
    /// A snapshot of the presenting view controller. To update, call `updatePresentingControlle()`
    var snapshotView: UIView?
    /// The container of the snapshot view, which is guaranteed to exist
    let snapshotViewContainer = UIView()
    /// A background view with the presented view's background color
    var gradeView: UIView = UIView()
    
    /// Whether the presented controller is currently being dismissed
    var isDismissing: Bool = false
    
    /// Whether the corner radius should be animated
    var animateCornerRadius: Bool {
        return self.safeArea.bottom == 0
    }
    
    /// The corner radius of the snapshot view
    var cornerRadius: CGFloat {
        return self.safeArea.bottom == 0 ? 5 : 20
    }
    
    /// Safe area insets
    var safeArea: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
        } else {
            return UIEdgeInsets.zero
        }
    }
    
    /// The identity transform of the snapshot view container, i.e. its resting state transform
    var identityTransformForSnapshot: CGAffineTransform {
        return CGAffineTransform.identity.translatedBy(x: 0, y: -height)
    }
    
    /// The frame of the presented view in its container view
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        return CGRect(x: 0, y: containerView.bounds.height - height, width: containerView.bounds.width, height: height)
    }
}

