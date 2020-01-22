//
//  ChampionAnalysisTableViewCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 21/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class ChampionAnalysisTableViewCell: UITableViewCell{
    
    var delegate: DataFromCellDelegate?
    var scrollDelegate: ChampionAnalysisScrollDelegate?
    
    let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpView(){
        collectionView.backgroundColor = .white
        collectionView.dataSource = (self as UICollectionViewDataSource)
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ChampionAnalysisCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        collectionView.anchors(width: widthAnchor, widthValue: 1, height: heightAnchor, heightValue: 1)
    }
}

// MARK: - UICollectionView data source
extension ChampionAnalysisTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChampionAnalysisCollectionViewCell
        cell.delegate = scrollDelegate
        return cell
    }
}

// MARK: - UIcollectionview delegate flow layout
extension ChampionAnalysisTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let index = IndexPath(item: Int(x / scrollView.bounds.width), section: 0)
        delegate?.passDataFromCell(indexPath: index)
    }
}

extension ChampionAnalysisTableViewCell: DataFromHeaderDelegate{
    func passDataFromHeader(indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}
