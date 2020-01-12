//
//  DamageBar.swift
//  LeagueStats
//
//  Created by Junyu Lin on 31/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

struct Damages{
    var dmageDealt: Int
    var maxDamage: Int
}

class DamageBar: UIView{
    
    var damages: Damages?{
        didSet{
            self.dmgView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: CGFloat(Double(self.damages!.dmageDealt) / Double(self.damages!.maxDamage))).isActive = true
            self.dmgView.updateConstraints()
        }
    }
    
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
        dmgView.anchors(left: leftAnchor, height: heightAnchor, heightValue: 1)
        
        addSubview(dmgLabel)
        dmgLabel.anchors(centerY: centerYAnchor, right: rightAnchor, rightConstant: -2)
    }
}
