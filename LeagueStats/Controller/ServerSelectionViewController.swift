//
//  ServerSelectionController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 12/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class ServerSelectionViewController: UIViewController{
    
    let serverCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupViews()
    }
    
    fileprivate func setupViews(){
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleClick)))
        view.backgroundColor = UIColor.black.withAlphaComponent(0.25)
    }
    
    @objc
    fileprivate func handleClick(){
        dismiss(animated: true, completion: nil)
    }
}
