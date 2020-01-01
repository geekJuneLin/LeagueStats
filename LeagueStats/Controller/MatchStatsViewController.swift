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
//    var matchDetail: MatchStats?{
//        didSet{
//            if let match = matchDetail {
//            }
//        }
//    }
    
    var titleCellId = "titleCellId"
    
    var cellId = "cellId"
    
    var showWinTitle = false
    
    var win: Bool?{
        didSet{
            if let win = win {
                navigationController?.navigationBar.topItem?.title = win ? "Win" : "Lose"
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
    
    // MARK: - data source delegate method
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
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
        if indexPath.item == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleCellId, for: indexPath) as! MatchTitleCell
            cell.winState = indexPath.section == 0 ? win! ? "Win" : "Lose" : win! ? "Lose" : "Win"
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1{
            return CGSize(width: collectionView.frame.width, height: 200)
        }
        return CGSize(width: 0, height: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerId", for: indexPath)
            return footer
    }
    
    // MARK: - set up collection view
    fileprivate func setUpCollectionView(){
        collectionView.showsVerticalScrollIndicator = false
        
        // register cell
        collectionView.register(MatchTitleCell.self, forCellWithReuseIdentifier: titleCellId)
        collectionView.register(MatchStatsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerId")
        
        collectionView.backgroundColor = .backgroudColor
    }
    
    // MARK: - set up navigationbar items
    fileprivate func setUpNavigation(){
        navigationController?.navigationBar.prefersLargeTitles = true

        if #available(iOS 13.0, *) {
            let app = UINavigationBarAppearance()
            app.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 26)]
            app.titleTextAttributes = [.foregroundColor : UIColor.white]
            app.backgroundColor = win! ? .winColor : .lossColor
            navigationController?.navigationBar.scrollEdgeAppearance = app
            navigationController?.navigationBar.standardAppearance = app
        } else {
            // Fallback on earlier versions
        }
    }
}
