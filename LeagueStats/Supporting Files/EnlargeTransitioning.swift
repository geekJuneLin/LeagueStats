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
        toVC.view.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.width, y: 0), size:
        CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        //fromVC.view.transform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .allowUserInteraction, animations: {
            toVC.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: UIScreen.main.bounds.size)
            fromVC.view.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        }) { (completed) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
