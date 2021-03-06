//
//  CardView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 30/11/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit
import SkeletonView

class CardView: UIView{
    
    var entries: [LeagueEntry]?{
        didSet{
            if let entry = entries{
                if entry.count != 0 {
                    DispatchQueue.main.async {
                        self.tierLabel.text = "\(entry[0].tier) \(entry[0].rank) (\(entry[0].leaguePoints))"
                    }
                }
            }
        }
    }
    
    var summoner: SummonerInfo?{
        didSet{
            if let summoner = summoner{
                DispatchQueue.main.async {
                    self.avator.loadImgWithUrl("https://avatar.leagueoflegends.com/oce/\(summoner.name).png", "\(summoner.name).png")
                    self.nameLabel.text = summoner.name
                    self.levelLabel.text = " \(summoner.level) "
                }
            }
        }
    }
    
    let avator: UIImageView = {
       let view = UIImageView()
        view.isSkeletonable = true
        view.image = UIImage(named: "dinosaur")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 35
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.isSkeletonable = true
        label.text = "0x73002"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let levelLabel: UILabel = {
       let label = UILabel()
        label.isSkeletonable = true
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        label.textColor = .white
        label.text = " 48 "
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tierLabel: UILabel = {
       let label = UILabel()
        label.isSkeletonable = true
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Silver 1 (38LP)"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customLayout()
        setUpViews()
    }
    
    fileprivate func customLayout(){
        backgroundColor = .white
        
        layer.masksToBounds = false
        layer.cornerRadius = 10
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
    }
    
    fileprivate func setUpViews(){
        addSubview(avator)
        addSubview(nameLabel)
        addSubview(levelLabel)
        addSubview(tierLabel)
        
        avator.anchors(top: topAnchor, topConstant: 15, left: leftAnchor, leftConstant: 15, widthValue: 70, heightValue: 70)
//        avator.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
//        avator.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
//        avator.widthAnchor.constraint(equalToConstant: 70).isActive = true
//        avator.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        nameLabel.anchors(top: avator.topAnchor, topConstant: 10, left: avator.rightAnchor, leftConstant: 10)
//        nameLabel.leftAnchor.constraint(equalTo: avator.rightAnchor, constant: 10).isActive = true
//        nameLabel.topAnchor.constraint(equalTo: avator.topAnchor, constant: 10).isActive = true
        
        levelLabel.anchors(bottom: avator.bottomAnchor, right: avator.rightAnchor, rightConstant: -2)
//        levelLabel.bottomAnchor.constraint(equalTo: avator.bottomAnchor).isActive = true
//        levelLabel.rightAnchor.constraint(equalTo: avator.rightAnchor, constant: -2).isActive = true
        
        tierLabel.anchors(top: nameLabel.bottomAnchor, topConstant: 10, left: nameLabel.leftAnchor)
//        tierLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
//        tierLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
