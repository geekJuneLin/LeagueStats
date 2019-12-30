//
//  MatchTitleCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 30/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class MatchTitleCell: UICollectionViewCell{
    var winState: String?{
        didSet{
            if let state = winState {
                if state == "L"{
                    backgroundColor = .lossTitleColor
                    win.text = "Loss (Red)"
                    dragonImg.image = UIImage(named: "dragon-red")
                    baronImg.image = UIImage(named: "baron-red")
                    towerImg.image = UIImage(named: "tower-red")
                }else{
                    backgroundColor = .winTitleColor
                    win.text = "Win (Blue)"
                    dragonImg.image = UIImage(named: "dragon-blue")
                    baronImg.image = UIImage(named: "baron-blue")
                    towerImg.image = UIImage(named: "tower-blue")
                }
            }
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
        label.text = "24 / 38 / 27"
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
        win.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        win.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(statsImg)
        statsImg.leftAnchor.constraint(equalTo: win.rightAnchor, constant: 4).isActive = true
        statsImg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        statsImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        statsImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(statsLabel)
        statsLabel.leftAnchor.constraint(equalTo: statsImg.rightAnchor, constant: 4).isActive = true
        statsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(towerCount)
        towerCount.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        towerCount.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(towerImg)
        towerImg.rightAnchor.constraint(equalTo: towerCount.leftAnchor, constant: -4).isActive = true
        towerImg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        towerImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        towerImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(baronCount)
        baronCount.rightAnchor.constraint(equalTo: towerImg.leftAnchor, constant: -5).isActive = true
        baronCount.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(baronImg)
        baronImg.rightAnchor.constraint(equalTo: baronCount.leftAnchor, constant: -4).isActive = true
        baronImg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        baronImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        baronImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(dragonCount)
        dragonCount.rightAnchor.constraint(equalTo: baronImg.leftAnchor, constant: -5).isActive = true
        dragonCount.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(dragonImg)
        dragonImg.rightAnchor.constraint(equalTo: dragonCount.leftAnchor, constant: -4).isActive = true
        dragonImg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dragonImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        dragonImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
