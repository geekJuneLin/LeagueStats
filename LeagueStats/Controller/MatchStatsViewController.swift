//
//  MatchStatsViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 8/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class MatchStatsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    // MARK: - variables
    var showWinTitle = false
    
    var win: String?{
        didSet{
            if let win = win {
                navigationController?.navigationBar.barTintColor = win == "L" ? .lossColor : .winColor
                navigationController?.navigationBar.topItem?.title = win == "L" ? "Loss" : "Win"
            }
        }
    }
    
    let titleWinView: UILabel = {
       let label = UILabel()
        label.text = "LOSS"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleView: UIView = {
       let view = UIView()
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        setUpNavigation()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
//        if offsetY > collectionView.frame.height * 0.8 && !showWinTitle{
//            showWinTitle = true
//            navigationController?.navigationBar.topItem?.titleView?.isHidden = true
//        }
//
//        if offsetY < collectionView.frame.height * 0.8 && showWinTitle {
//            showWinTitle = false
//            navigationController?.navigationBar.topItem?.titleView?.isHidden = false
//        }
    }
    
    // MARK: - data source delegate method
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = .winColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    // MARK: - set up collection view
    fileprivate func setUpCollectionView(){
        // register cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.backgroundColor = .white
        
        // set up title view which is below the navigation bar
        collectionView.addSubview(titleView)
        titleView.widthAnchor.constraint(equalTo: collectionView.widthAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: collectionView.heightAnchor, multiplier: 0.08).isActive = true
        titleView.topAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        
        titleView.addSubview(titleWinView)
        titleWinView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        titleWinView.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 8).isActive = true
        titleWinView.widthAnchor.constraint(equalTo: titleView.widthAnchor, multiplier: 0.3).isActive = true
        titleWinView.heightAnchor.constraint(equalTo: titleView.heightAnchor
            , multiplier: 0.8).isActive = true
    }
    
    // TODO: set up navigationbar items
    fileprivate func setUpNavigation(){
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
