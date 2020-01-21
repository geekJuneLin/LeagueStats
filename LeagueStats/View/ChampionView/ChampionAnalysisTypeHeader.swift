//
//  ChampionAnalysisTypeHeader.swift
//  LeagueStats
//
//  Created by Junyu Lin on 20/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class ChampionAnalysisTypeHeader: UITableViewHeaderFooterView{
    
    let cellId = "cellId"
    
    let type = ["TOP",
                "JUNGLE",
                "MID",
                "BOTTOM",
                "SUPPORT"]
    
    var delegate: DataFromHeaderDelegate?
    
    let backgroundV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.backgroudColor.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bar: UIView = {
       let view = UIView()
        view.backgroundColor = .backgroudColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpView(){
        let backV = UIView()
        backV.backgroundColor = .white
        self.backgroundView = backV
        self.addSubview(backgroundV)
        backgroundV.anchors(width: self.backgroundView?.widthAnchor, widthValue: 1, height: self.backgroundView?.heightAnchor, heightValue: 1)
        
        backgroundV.isScrollEnabled = false
        backgroundV.showsHorizontalScrollIndicator = false
        backgroundV.dataSource = self
        backgroundV.delegate = self
        backgroundV.register(ChampionAnalysisTypeHeaderCell.self, forCellWithReuseIdentifier: cellId)
        backgroundV.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: [])
        
        backgroundV.addSubview(bar)
    }
}

// MARK: - UICollectionView Data source
extension ChampionAnalysisTypeHeader: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return type.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChampionAnalysisTypeHeaderCell
        cell.typeLbl.text = type[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ChampionAnalysisTypeHeader: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 5, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.passDataFromHeader(indexPath: indexPath)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if let cell = collectionView.cellForItem(at: indexPath) as? ChampionAnalysisTypeHeaderCell{
            cell.isSelected = true
        }
    }
}

extension ChampionAnalysisTypeHeader: DataFromCellDelegate{
    func passDataFromCell(indexPath: IndexPath) {
        print("header get the index from cell: \(indexPath.item)")
        backgroundV.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}
