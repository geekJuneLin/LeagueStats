//
//  StatsView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 30/11/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatsViewNaviController: UINavigationController{
    var cardDelegate: cardViewDelegate?
    var matchList: MatchList?{
        didSet{
            if let matches = matchList {
            }
        }
    }
    
    let vc: StatsMainViewController = {
       let view = StatsMainViewController(collectionViewLayout: UICollectionViewFlowLayout())
        return view
    }()
    
    let goBackBarBtn: UIBarButtonItem = {
        let btn = UIButton(type: .system)
        btn.setTitle("Go back", for: .normal)
        btn.setTitleColor(UIColor(red: 44/255, green: 128/255, blue: 255/255, alpha: 0.9), for: .normal)
        btn.addTarget(self, action: #selector(handleGoBack), for: .touchUpInside)
        let button = UIBarButtonItem(customView: btn)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = .custom
        transitioningDelegate = self
        viewControllers = [vc]
        self.navigationBar.topItem?.leftBarButtonItem = goBackBarBtn
    }
    
    @objc fileprivate func handleGoBack(){
        print("Button clicked")
        UIView.animate(withDuration: 1.5, animations: {
            self.dismiss(animated: true, completion: nil)
        }) { (completed) in
            self.cardDelegate?.recoverCardView()
        }
    }
}

protocol cardViewDelegate{
    func recoverCardView()
}

extension StatsViewNaviController: UIViewControllerTransitioningDelegate{
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransitioning()
    }
}


