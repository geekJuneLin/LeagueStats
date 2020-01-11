//
//  StatsTopView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 1/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatsTopView: UICollectionReusableView{
    var summonerInfo: SummonerInfoModel? {
        didSet{
            
            if let summoner = summonerInfo{
                DispatchQueue.main.async {
                    self.levelLabel.text = " \(summoner.level) "
                    self.nameLabel.text = summoner.name
                    self.tierLabel.text = summoner.tier
                    self.tierLabel.text?.append("(\(summoner.points)LP)")
                    self.heroImg.loadImgWithUrl("https://avatar.leagueoflegends.com/oce/\(summoner.name).png", "\(summoner.name).png")
                }
            }
        }
    }
    
    let background: UIView = {
       let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let heroImg: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "dinosaur")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let levelLabel: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Summoner"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tierLabel: UILabel = {
       let label = UILabel()
        label.text = "No tier"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    fileprivate func setUpViews(){
        addSubview(background)
        background.addSubview(heroImg)
        background.addSubview(levelLabel)
        background.addSubview(nameLabel)
        background.addSubview(tierLabel)
        
        background.anchors(centerX: centerXAnchor, centerY: centerYAnchor)
        background.anchors(width: widthAnchor, widthValue: 0.9, height: heightAnchor, heightValue: 0.8)
        
        heroImg.anchors(top: background.topAnchor, topConstant: 15, left: background.leftAnchor, leftConstant: 15, widthValue: 80, heightValue: 80)
        
        levelLabel.anchors(centerX: heroImg.centerXAnchor, bottom: heroImg.bottomAnchor)
        
        nameLabel.anchors(top: heroImg.topAnchor, topConstant: 15, left: heroImg.rightAnchor, rightConstant: 10)
        
        tierLabel.anchors(top: nameLabel.bottomAnchor, topConstant: 5, left: nameLabel.leftAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
