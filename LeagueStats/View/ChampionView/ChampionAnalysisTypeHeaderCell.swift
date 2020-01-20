//
//  ChampionAnalysisTypeHeaderCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 20/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class ChampionAnalysisTypeHeaderCell: UICollectionViewCell{
    
//    var isClicked: Bool?{
//        didSet{
//            if let clicked = isClicked{
//                UIView.animate(withDuration: 1) {
//                    self.indicator.isHidden = !clicked
//                    self.typeLbl.textColor = clicked ? .winColor : .black
//                }
//            }
//        }
//    }
    
    override var isSelected: Bool{
        didSet{
            UIView.animate(withDuration: 1) {
                self.indicator.isHidden = self.isSelected ? false : true
                self.typeLbl.textColor = self.isSelected ? .winColor : .black
            }
        }
    }
    
    let typeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let indicator: UIView = {
       let bar = UIView()
        bar.backgroundColor = .winColor
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews(){
        addSubview(typeLbl)
        typeLbl.anchors(centerX: centerXAnchor, centerY: centerYAnchor)
        
        addSubview(indicator)
        indicator.isHidden = true
        indicator.anchors(centerX: centerXAnchor, bottom: bottomAnchor, widthValue: 14, heightValue: 4)
    }
}
