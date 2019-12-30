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
    var matchDetail: MatchStats?{
        didSet{
            if let match = matchDetail {
                titleView.title.text = match.win
            }
        }
    }
    
    var titleCellId = "titleCellId"
    
    var cellId = "cellId"
    
    var showWinTitle = false
    
    var win: String?{
        didSet{
            if let win = win {
                navigationController?.navigationBar.barTintColor = win == "L" ? .lossColor : .winColor
                navigationController?.navigationBar.topItem?.title = win == "L" ? "Loss" : "Win"
                titleView.backgroundColor = win == "L" ? .lossTitleColor : .winTitleColor
            }
        }
    }
    
    let titleView: TitleView = {
       let view = TitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        setUpNavigation()
    }
    
    // TODO: - fixed showing n hiding the title
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
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0{
            return UIEdgeInsets(top: collectionView.frame.height * 0.1, left: 0, bottom: 0, right: 0)
        }
        if section == 1{
            return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 || section == 1{
            return 6
        }
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 && indexPath.section != 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleCellId, for: indexPath) as! MatchTitleCell
            cell.winState = win
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    // MARK: - set up collection view
    fileprivate func setUpCollectionView(){
        // register cell
        collectionView.register(MatchTitleCell.self, forCellWithReuseIdentifier: titleCellId)
        collectionView.register(MatchStatsCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.backgroundColor = .backgroudColor
        
        // set up title view which is below the navigation bar
        collectionView.addSubview(titleView)
        titleView.widthAnchor.constraint(equalTo: collectionView.widthAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: collectionView.heightAnchor, multiplier: 0.1).isActive = true
        titleView.topAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
    }
    
    // TODO: set up navigationbar items
    fileprivate func setUpNavigation(){
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
