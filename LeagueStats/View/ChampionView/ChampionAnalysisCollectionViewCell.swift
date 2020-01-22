//
//  ChampionAnalysisCollectionViewCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 21/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

protocol ChampionAnalysisScrollDelegate {
    func needToScroll(offsetY: CGFloat)
}

class ChampionAnalysisCollectionViewCell: UICollectionViewCell{
    
    let cellId = "cellId"
    
    var delegate: ChampionAnalysisScrollDelegate?
    
    let collecionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setUpView(){
        collecionView.dataSource = self
        collecionView.delegate = self
        collecionView.showsVerticalScrollIndicator = false
        collecionView.register(ChampionAnalysisChampViewCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collecionView)
        collecionView.anchors(width: widthAnchor, widthValue: 1, height: heightAnchor, heightValue: 1)
    }
}

// MARK: - UICollectionView data source
extension ChampionAnalysisCollectionViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChampionAnalysisChampViewCell
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ChampionAnalysisCollectionViewCell: UICollectionViewDelegateFlowLayout{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print("has scrolled \(offsetY)")
        delegate?.needToScroll(offsetY: offsetY)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
