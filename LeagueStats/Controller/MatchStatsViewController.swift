//
//  MatchStatsViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 8/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class MatchStatsViewController: UICollectionViewController{
    
    // MARK: - variables
    var titleCellId = "titleCellId"
    
    var cellId = "cellId"
    
    var showWinTitle = false
    
    var matchStats: MatchStats!{
        didSet{
            print("Got the match stats in MatchStatsViewController \(matchStats.participantIDs.count)")
        }
    }
    
    var win: String?{
        didSet{
            if let win = win {
                navigationController?.navigationBar.topItem?.title = win == "W" ? "Win" : "Lose"
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
}

// MARK: - other functions
extension MatchStatsViewController{
    
    /// set up collection view
    fileprivate func setUpCollectionView(){
        collectionView.showsVerticalScrollIndicator = false
        
        // register cell
        collectionView.register(MatchTitleCell.self, forCellWithReuseIdentifier: titleCellId)
        collectionView.register(MatchStatsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerId")
        
        collectionView.backgroundColor = .backgroudColor
    }
    
    
    /// set up navigation controller
    fileprivate func setUpNavigation(){
        navigationController?.navigationBar.prefersLargeTitles = true

        if #available(iOS 13.0, *) {
            let app = UINavigationBarAppearance()
            app.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 26)]
            app.titleTextAttributes = [.foregroundColor : UIColor.white]
            app.backgroundColor = win! == "W" ? .winColor : .lossColor
            navigationController?.navigationBar.scrollEdgeAppearance = app
            navigationController?.navigationBar.standardAppearance = app
        } else {
            // Fallback on earlier versions
        }
    }
    
    fileprivate func getMatchStatsCellModel(_ index: Int) -> MatchStatsCellModel{
        return MatchStatsCellModel(participantIds: matchStats!.participantIDs[index], participants: matchStats!.participants[index])
    }
}

// MARK: - data source delegte
extension MatchStatsViewController{
    
    // number of sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // number of items in each section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 || section == 1{
            return 6
        }
        return 1
    }
}

// MARK: - UICollectionDelegateFlowLayout
extension MatchStatsViewController: UICollectionViewDelegateFlowLayout{
    
    // edgeInsets for each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1{
            return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // minimum spacing for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // cell at each index
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleCellId, for: indexPath) as! MatchTitleCell
            cell.winState = indexPath.section == 0 ? win! : win! == "W" ? "L" : "W"
            return cell
        }
        
        // cell for each participant
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MatchStatsCell
        cell.backgroundColor = .white

        if indexPath.section == 0 && indexPath.item > 0 && indexPath.item < 6{
            print("WIN STATUS: \(win!)")
            if win! == "W"{
                if matchStats.participants[0].stats.win{
                    cell.matchStatsCellModel = getMatchStatsCellModel(indexPath.item - 1)
                }else{
                    cell.matchStatsCellModel = getMatchStatsCellModel(indexPath.item + 4)
                }
            }else{
                if !matchStats.participants[0].stats.win{
                    cell.matchStatsCellModel = getMatchStatsCellModel(indexPath.item - 1)
                }else{
                    cell.matchStatsCellModel = getMatchStatsCellModel(indexPath.item + 4)
                }
            }
        }
        if indexPath.section == 1{
            if win! == "W"{
                if matchStats.participants[0].stats.win{
                    cell.matchStatsCellModel = getMatchStatsCellModel(indexPath.item + 4)
                }else{
                    cell.matchStatsCellModel = getMatchStatsCellModel(indexPath.item - 1)
                }
            }else{
                if !matchStats.participants[0].stats.win{
                    cell.matchStatsCellModel = getMatchStatsCellModel(indexPath.item + 4)
                }else{
                    cell.matchStatsCellModel = getMatchStatsCellModel(indexPath.item - 1)
                }
            }
        }

        return cell
    }
    
    // size for each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    // size for footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1{
            return CGSize(width: collectionView.frame.width, height: 200)
        }
        return CGSize(width: 0, height: 0)
    }
    
    // footer
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerId", for: indexPath)
            return footer
    }
}
