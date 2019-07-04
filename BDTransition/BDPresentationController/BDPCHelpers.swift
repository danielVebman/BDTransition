//
//  BDPCHelpers.swift
//  BDViewController
//
//  Created by Daniel Vebman on 7/4/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import Foundation
import UIKit

extension BDPresentationController {
    /// constrains a view's anchors to another view
    func constrain(view: UIView, to anotherView: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anotherView.topAnchor),
            view.leftAnchor.constraint(equalTo: anotherView.leftAnchor),
            view.rightAnchor.constraint(equalTo: anotherView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: anotherView.bottomAnchor)
        ])
    }
    
    /// animates a view's corner radius
    func addCornerRadiusAnimation(for view: UIView?, cornerRadius: CGFloat, duration: CFTimeInterval) {
        guard let view = view else { return }
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fromValue = view.layer.cornerRadius
        animation.toValue = cornerRadius
        animation.duration = duration
        view.layer.add(animation, forKey: "cornerRadius")
        view.layer.cornerRadius = cornerRadius
    }
    
    /// updates the current snapshot view
    func updateSnapshot() {
        guard let currentSnapshotView = presentingViewController.view.snapshotView(afterScreenUpdates: true) else { return }
        snapshotView?.removeFromSuperview()
        snapshotViewContainer.addSubview(currentSnapshotView)
        constrain(view: currentSnapshotView, to: snapshotViewContainer)
        snapshotView = currentSnapshotView
        snapshotView?.layer.cornerRadius = cornerRadius
        snapshotView?.layer.masksToBounds = true
    }
}
