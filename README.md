# BDTransition
A resizing bottom drawer transition heavily inspired by [SPLarkController](https://github.com/ivanvorobei/SPLarkController).

The transition is very easy to implement:

    let controller = UIViewController()
    let transitionDelegate = BDTransitioningDelegate(height: 300)
    controller.transitioningDelegate = transitionDelegate
    controller.modalPresentationStyle = .custom
    controller.modalPresentationCapturesStatusBarAppearance = true
    present(controller, animated: true, completion: nil)
    
To update the height of the presented controller, simply:

    if let presentationController = presentationController as? BDPresentationController {
        presentationController.updateHeight(600)
    }
    
And that's it!
