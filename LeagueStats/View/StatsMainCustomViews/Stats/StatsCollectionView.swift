//
//  StatsCollectionView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 2/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatsCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    // MARK: - variable
    var refreshFlag: Bool = false
    
    var cellDelegate: cellDelegate?
    
    let cellId = "cellId"
    
    var count: Int = 0
    
    var status: [StatusModel]?{
        didSet{
            print("status models have been assigned \(status?.count)")
        }
    }
    
    let refresh: BottomRefresh = {
        let view = BottomRefresh()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    // MARK: - init func
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    // MARK: - setUpViews func
    fileprivate func setUpViews(){
        // set delegate and data source
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubview(collectionView)
        
        // register cell
        collectionView.register(StatsViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(BottomRefresh.self, forCellWithReuseIdentifier: "refresh")
        
        
        collectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    // MARK: - numberOfSections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // MARK: - UICollectionViewDataSource delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            count = status?.count ?? 0
            return Int(Double(count) * 0.1)
        }else if section == 1 && refreshFlag{
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StatsViewCell
            cell.backgroundColor = .white
            cell.status = status?[indexPath.item]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "refresh", for: indexPath) as! BottomRefresh
            cell.indicator.startAnimating()
            return cell
        }
    }
    
    // MARK: - scrollView delegate func
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let height = scrollView.contentSize.height
        
        if offsetY > height - scrollView.frame.height && !refreshFlag{
            print("reach the bottom")
            loadMoreData()
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: self.frame.width, height: self.frame.height * 0.22)
        }else{
            return CGSize(width: self.frame.width, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you've selected \(indexPath.item) cell")
        
        cellDelegate?.presentMatchView()
    }
    
    fileprivate func loadMoreData(){
        refreshFlag = true
        collectionView.reloadSections(IndexSet(integer: 1))
        refreshFlag = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol cellDelegate {
    func presentMatchView()
}
