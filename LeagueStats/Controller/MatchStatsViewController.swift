//
//  MatchStatsViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 8/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class MatchStatsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        setUpNavigation()
    }
    
    fileprivate func setUpCollectionView(){
        collectionView.backgroundColor = .cyan
    }
    
    // TODO: set up navigationbar items
    fileprivate func setUpNavigation(){
//        navigationItem
    }
}
