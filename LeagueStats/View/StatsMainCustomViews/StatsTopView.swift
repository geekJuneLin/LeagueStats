//
//  StatsTopView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 1/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatsTopView: UIView{
    var summonerInfo: SummonerInfoModel? {
        didSet{
            if let level = summonerInfo?.level {
                levelLabel.text = " \(level) "
            }
            
            if let name = summonerInfo?.name{
                nameLabel.text = name
            }
            
            if let tier = summonerInfo?.tier{
                tierLabel.text = tier
            }
            
            if let point = summonerInfo?.points{
                tierLabel.text?.append("(\(point)LP)")
            }
        }
    }
    
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
        //label.text = " 48 "
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
        //label.text = "0x73002"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tierLabel: UILabel = {
       let label = UILabel()
        //label.text = "Silver 1 (38LP)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    fileprivate func setUpViews(){
        addSubview(heroImg)
        addSubview(levelLabel)
        addSubview(nameLabel)
        addSubview(tierLabel)
        
        heroImg.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        heroImg.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        heroImg.widthAnchor.constraint(equalToConstant: 80).isActive = true
        heroImg.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        levelLabel.bottomAnchor.constraint(equalTo: heroImg.bottomAnchor).isActive = true
        levelLabel.centerXAnchor.constraint(equalTo: heroImg.centerXAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: heroImg.topAnchor, constant: 15).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: heroImg.rightAnchor, constant: 10).isActive = true
        
        tierLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        tierLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
