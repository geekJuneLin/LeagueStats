//
//  EnlargeTransitioning.swift
//  LeagueStats
//
//  Created by Junyu Lin on 5/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class EnlargeTransitioning: NSObject{
    
}

extension EnlargeTransitioning: UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to)
              else{ return }
        
        let containerView = transitionContext.containerView
        
        containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
        toVC.view.frame = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.height/4), size:
        CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .allowUserInteraction, animations: {
            toVC.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: UIScreen.main.bounds.size)
        }) { (completed) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
