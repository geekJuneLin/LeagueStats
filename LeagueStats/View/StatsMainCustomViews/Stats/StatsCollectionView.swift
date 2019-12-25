//
//  StatsCollectionView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 2/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatsCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
//    var matchList: MatchList?{
//        didSet{
//            if let matches = matchList{
//            }
//        }
//    }
    
    var cellDelegate: cellDelegate?
    
    let cellId = "cellId"
    
    var status: [StatusModel]?{
        didSet{
            print("status models have been assigned \(status?.count)")
        }
    }
    
    // - TODO: Customize the UIRefreshControll 
    let refreshControll: UIRefreshControl = {
        let controll = UIRefreshControl()
        controll.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        controll.tintColor = UIColor(red: 44/255, green: 128/255, blue: 255/255, alpha: 0.5)
        return controll
    }()
    
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceVertical = true
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    fileprivate func setUpViews(){
        // set delegate and data source
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubview(collectionView)
        collectionView.addSubview(refreshControll)
        
        // register cell
        collectionView.register(StatsViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return status?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StatsViewCell
        cell.backgroundColor = .white
        cell.status = status?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you've selected \(indexPath.item) cell")
        
        cellDelegate?.presentMatchView()
    }
    
    @objc
    fileprivate func handleRefresh(){
        print("refreshed!")
//        status.append(StatusModel(status: "L", time: "28:28"))
//        status.append(StatusModel(status: "W", time: "30:26"))
//        status.append(StatusModel(status: "W", time: "38:12"))
//        status.append(StatusModel(status: "L", time: "25:39"))
        refreshControll.endRefreshing()
        collectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol cellDelegate {
    func presentMatchView()
}
