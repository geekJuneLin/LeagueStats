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
//                titleView.title.text = match.win
            }
        }
    }
    
    var titleCellId = "titleCellId"
    
    var cellId = "cellId"
    
    var showWinTitle = false
    
    var win: String?{
        didSet{
            if let win = win {
                navigationController?.navigationBar.topItem?.title = win == "L" ? "Loss" : "Win"
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
            cell.winState = indexPath.section == 0 ? win : win == "L" ? "W" : "L"
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
        // register cell
        collectionView.register(MatchTitleCell.self, forCellWithReuseIdentifier: titleCellId)
        collectionView.register(MatchStatsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerId")
        
        collectionView.backgroundColor = .backgroudColor
    }
    
    // MARK: - set up navigationbar items
    fileprivate func setUpNavigation(){
//        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.prefersLargeTitles = true

        if #available(iOS 13.0, *) {
            let app = UINavigationBarAppearance()
            app.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 26)]
            app.backgroundColor = win == "L" ? .lossColor : .winColor
            navigationController?.navigationBar.scrollEdgeAppearance = app
            navigationController?.navigationBar.standardAppearance = app
        } else {
            // Fallback on earlier versions
        }
    }
}
