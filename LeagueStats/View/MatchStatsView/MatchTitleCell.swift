//
//  MatchTitleCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 30/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class MatchTitleCell: UICollectionViewCell{
    
    var matchTitleCellViewModel: MatchTitleCellViewModel!{
        didSet{
            backgroundColor = matchTitleCellViewModel.backgroundColor
            win.attributedText = matchTitleCellViewModel.winState
            dragonImg.image = matchTitleCellViewModel.dragonImg
            baronImg.image = matchTitleCellViewModel.baronImg
            towerImg.image = matchTitleCellViewModel.towerImg
            baronCount.text = matchTitleCellViewModel.baronKills
            dragonCount.text = matchTitleCellViewModel.dragonKills
            towerCount.text = matchTitleCellViewModel.towerKills
            statsLabel.attributedText = matchTitleCellViewModel.teamStats
        }
    }
    
    let win: UILabel = {
        let label = UILabel()
        label.text = "Loss (Red)"
        label.textColor = .lossColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statsImg: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "stats")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let statsLabel: UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dragonImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dragon-red")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dragonCount: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let baronImg: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "baron-red")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let baronCount: UILabel = {
       let label = UILabel()
        label.text = "2"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let towerImg: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "tower-red")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let towerCount: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    fileprivate func setUpViews(){
        addSubview(win)
        win.anchors(centerY: centerYAnchor, left: leftAnchor, leftConstant: 5)
        
        addSubview(statsImg)
        statsImg.anchors(centerY: centerYAnchor, left: win.rightAnchor, leftConstant: 4, widthValue: 20, heightValue: 20)
        
        addSubview(statsLabel)
        statsLabel.anchors(centerY: centerYAnchor, left: statsImg.rightAnchor, leftConstant: 4)
        
        addSubview(towerCount)
        towerCount.anchors(centerY: centerYAnchor, right: rightAnchor, rightConstant: -5)
        
        addSubview(towerImg)
        towerImg.anchors(centerY: centerYAnchor, right: towerCount.leftAnchor, rightConstant: -4, widthValue: 20, heightValue: 20)
        
        addSubview(baronCount)
        baronCount.anchors(centerY: centerYAnchor, right: towerImg.leftAnchor, rightConstant: -5)
        
        addSubview(baronImg)
        baronImg.anchors(centerY: centerYAnchor, right: baronCount.leftAnchor, rightConstant: -4, widthValue: 20, heightValue: 20)
        
        addSubview(dragonCount)
        dragonCount.anchors(centerY: centerYAnchor, right: baronImg.leftAnchor, rightConstant: -5)
        
        addSubview(dragonImg)
        dragonImg.anchors(centerY: centerYAnchor, right: dragonCount.leftAnchor, rightConstant: -4, widthValue: 20, heightValue: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
