//
//  TierViewCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 2/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class TierViewCell: UICollectionViewCell{
    var tier: TierModel? {
        didSet{
            // load accroding tier image
            if let img = tier?.tier.tierImg {
                tierImg.image = img
            }
            
            // load accroding game type
            if let type = tier?.type {
                typeLabel.text = type
            }
            
            // load tier
            if let tier = tier?.tier.tier {
                tierLabel.text = tier
            }
            
            // load current points
            if let points = tier?.tier.point{
                pointLabel.text = "\(points) LP"
            }
            
            // load the win, lose and win rate
            if let win = tier?.tier.win, let loss = tier?.tier.loss {
                if loss == 0 && win == 0{
                    winRateLabel.text = "\(win)W \(loss)L (-)"
                }else if loss == 0 && win != 0{
                    winRateLabel.text = "\(win)W \(loss)L (100%)"
                }else{
                    let rate = Double(win) / (Double(win) + Double(loss)) * 100
                    winRateLabel.text = "\(win)W \(loss)L (\(String(format: "%.2f", rate))%)"
                }
            }
        }
    }
    
    let tierImg: UIImageView = {
       let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let typeLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tierLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pointLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let winRateLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    fileprivate func setUpViews(){
        // setup the cell frame
        layer.masksToBounds = true
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        layer.cornerRadius = 5
        
        addSubview(tierImg)
        addSubview(typeLabel)
        addSubview(tierLabel)
        addSubview(pointLabel)
        addSubview(winRateLabel)
        
        tierImg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tierImg.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        tierImg.widthAnchor.constraint(equalToConstant: 50).isActive = true
        tierImg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        typeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: tierImg.rightAnchor, constant: 10).isActive = true
        
        tierLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 2).isActive  = true
        tierLabel.leftAnchor.constraint(equalTo: typeLabel.leftAnchor).isActive = true
        
        pointLabel.topAnchor.constraint(equalTo: tierLabel.bottomAnchor, constant: 2).isActive = true
        pointLabel.leftAnchor.constraint(equalTo: tierLabel.leftAnchor).isActive = true
        
        winRateLabel.topAnchor.constraint(equalTo: pointLabel.bottomAnchor, constant: 2).isActive = true
        winRateLabel.leftAnchor.constraint(equalTo: pointLabel.leftAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
