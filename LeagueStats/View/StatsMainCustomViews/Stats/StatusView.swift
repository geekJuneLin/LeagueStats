//
//  StatusView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 2/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatusView: UIView{
    let statusLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separator: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    fileprivate func setUpViews(){
        addSubview(statusLabel)
        addSubview(separator)
        addSubview(timeLabel)
        
        statusLabel.anchors(centerX: centerXAnchor, top: topAnchor, topConstant: 25)

        separator.anchors(centerX: centerXAnchor, top: statusLabel.bottomAnchor, topConstant: 10, widthValue: 18, heightValue: 1.5)
        
        timeLabel.anchors(centerX: centerXAnchor, top: separator.bottomAnchor, topConstant: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
