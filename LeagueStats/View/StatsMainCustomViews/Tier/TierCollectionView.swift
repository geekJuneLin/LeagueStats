//
//  TierCollectionView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 2/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class TierCollectionView: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    let cellId = "cellId"
    
    let tierInfo: [TierModel] = [TierModel(type: "Flex Solo", tier: TierInfo(tier: "Silver 1", tierImg: UIImage(named: "dinosaur")!, point: 38, win: 46, loss: 25)),
                                 TierModel(type: "Flex 5:5 Rank", tier: TierInfo(tier: "Unranked", tierImg: UIImage(named: "dinosaur")!, point: 43, win: 44, loss: 43)),
                                 TierModel(type: "Flex 3:3 Rank", tier: TierInfo(tier: "Unranked", tierImg: UIImage(named: "dinosaur")!, point: 0, win: 0, loss: 0))]
    
    let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(menuCollectionView)
        
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        
        menuCollectionView.register(TierViewCell.self, forCellWithReuseIdentifier: cellId)
        
        menuCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        menuCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TierViewCell
        cell.backgroundColor = .white
        cell.tier = tierInfo[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 3 / 5 - 25, height: collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
