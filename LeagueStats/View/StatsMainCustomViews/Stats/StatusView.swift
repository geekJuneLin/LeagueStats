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
        
        statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        separator.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        separator.widthAnchor.constraint(equalToConstant: 18).isActive = true
        separator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10).isActive = true
        timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
