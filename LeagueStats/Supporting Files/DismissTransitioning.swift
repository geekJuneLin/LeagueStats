//
//  DismissTransitioning.swift
//  LeagueStats
//
//  Created by Junyu Lin on 29/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class DismissTransitioning: NSObject{
    
}

extension DismissTransitioning: UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to)
            else{ return }
        
        let containerView = transitionContext.containerView
        
        containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromVC.view.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
            toVC.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { (finished) in
            UIApplication.shared.keyWindow?.addSubview(toVC.view)
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    
}
