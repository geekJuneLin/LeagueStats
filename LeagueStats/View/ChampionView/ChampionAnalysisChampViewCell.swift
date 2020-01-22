//
//  ChampionAnalysisChampViewCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 22/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class ChampionAnalysisChampViewCell: UICollectionViewCell{
    
    let numberLbl: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let champImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dinosaur")
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let champRank: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let champName: UILabel = {
       let label = UILabel()
        label.text = "Oron"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let champTier: UILabel = {
       let label = UILabel()
        label.text = "1 Tier"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let winRate: UILabel = {
       let label = UILabel()
        label.text = "Win %"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pickRate: UILabel = {
       let label = UILabel()
        label.text = "Pick %"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let banRate: UILabel = {
       let label = UILabel()
        label.text = "Ban %"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let win: UILabel = {
       let label = UILabel()
        label.text = "52.0%"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pick: UILabel = {
       let label = UILabel()
        label.text = "12.3%"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ban: UILabel = {
       let label = UILabel()
        label.text = "9.0%"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bar: UIView = {
       let v = UIView()
        v.backgroundColor = .black
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpView(){
        backgroundColor = .white
        
        addSubView(numberLbl, champImg, champName, champRank, champTier, pickRate, banRate, winRate, bar, win, pick, ban)
        
        numberLbl.anchors(centerY: centerYAnchor, left: leftAnchor, leftConstant: 8)
        champImg.anchors(centerY: centerYAnchor, left: numberLbl.rightAnchor, leftConstant: 12, widthValue: 50, heightValue: 50)
        champName.anchors(top: champImg.topAnchor, left: champImg.rightAnchor, leftConstant: 12)
        champRank.anchors(bottom: champImg.bottomAnchor, right: champImg.rightAnchor)
        champTier.anchors(top: champName.bottomAnchor, bottomConstant: 4, left: champName.leftAnchor)
        pick.anchors(centerY: centerYAnchor, right: rightAnchor, rightConstant: -20)
        win.anchors(bottom: pick.topAnchor, bottomConstant: -4, right: pick.rightAnchor)
        ban.anchors(top: pick.bottomAnchor, topConstant: 4, right: pick.rightAnchor)
        pickRate.anchors(centerY: pick.centerYAnchor,right: pick.leftAnchor, rightConstant: -12)
        winRate.anchors(bottom: pickRate.topAnchor, bottomConstant: -4, left: pickRate.leftAnchor)
        banRate.anchors(top: pickRate.bottomAnchor, topConstant: 4, left: pickRate.leftAnchor)
        bar.anchors(bottom: bottomAnchor, right: rightAnchor, rightConstant: -20, width: widthAnchor, widthValue: 0.75, heightValue: 0.5)
    }
}
