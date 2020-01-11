//
//  TabBarController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 11/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class TarBarHomeViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    fileprivate func setupViews(){
        let firstVC = UINavigationController(rootViewController: ViewController())
        if #available(iOS 13.0, *) {
            let img = UIImage(systemName: "doc.text.magnifyingglass")
            img?.withRenderingMode(.alwaysTemplate)
            img?.withTintColor(.winTitleColor)
            firstVC.tabBarItem = UITabBarItem(title: "Search", image: img, tag: 0)
        } else {
            // Fallback on earlier versions
        }
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .cyan
        secondVC.navigationController?.navigationBar.topItem?.title = "Champion"
        if #available(iOS 13.0, *) {
            let img = UIImage(systemName: "s.circle")
            secondVC.tabBarItem = UITabBarItem(title: "Champion", image: img, tag: 1)
        } else {
            // Fallback on earlier versions
        }
        
        self.viewControllers = [firstVC, secondVC]
    }
    
    
}
