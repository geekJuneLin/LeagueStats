//
//  DamageBar.swift
//  LeagueStats
//
//  Created by Junyu Lin on 31/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class DamageBar: UIView{
    
    let dmgView: UIView = {
       let view = UIView()
        view.backgroundColor = .lossColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dmgLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        label.text = "7,470"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .barGray
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews(){
        addSubview(dmgView)
        dmgView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dmgView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        addSubview(dmgLabel)
        dmgLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dmgLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -2).isActive = true
    }
}
