//
//  ViewController.swift
//  BDTransitionTest
//
//  Created by Daniel Vebman on 7/5/19.
//  Copyright © 2019 Daniel Vebman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        let v = UIView(frame: view.bounds.insetBy(dx: 50, dy: 50))
        v.backgroundColor = .orange
        view.addSubview(v)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDetail)))
    }
    
    @objc func showDetail() {
        let controller = DetailViewController()
        let transitionDelegate = BDTransitioningDelegate(height: 300)
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .custom
        controller.modalPresentationCapturesStatusBarAppearance = true
        present(controller, animated: true, completion: nil)
    }
}

class DetailViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .red
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(expand)))
    }
    
    @objc func expand() {
        if let presentationController = presentationController as? BDPresentationController {
            if view.frame.height == 300 {
                presentationController.updateHeight(600)
            } else {
                presentationController.updateHeight(300)
            }
        }
    }
}
 
