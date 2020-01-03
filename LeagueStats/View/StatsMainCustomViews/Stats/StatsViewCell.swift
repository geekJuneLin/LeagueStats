//
//  StatsViewCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 2/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatsViewCell: UICollectionViewCell{
    
    let uri_origin = "https://ddragon.leagueoflegends.com/cdn/9.24.2/img/"
    
    var statsViewCellModel: StatsViewCellModel!{
        didSet{
            statusView.statusLabel.text = statsViewCellModel.win
            statusView.backgroundColor = statsViewCellModel.statusBackgroundColor
            statusView.timeLabel.text = statsViewCellModel.time
            KDALabel.attributedText = statsViewCellModel.kda
            KPLabel.text = statsViewCellModel.kp
            champImg.loadImgWithUrl(uri_origin + "champion/\(statsViewCellModel.champName).png")
            firstSpell.loadImgWithUrl(uri_origin + "spell/\(statsViewCellModel.spell1).png")
            secondSpell.loadImgWithUrl(uri_origin + "spell/\(statsViewCellModel.spell2).png")
            itemView.images = statsViewCellModel.images
            gameTypeLabel.text = statsViewCellModel.gameType
            dateLabel.text = statsViewCellModel.gameDate
        }
    }
    
    let statusView: StatusView = {
        let view = StatusView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let champImg: UIImageView = {
       let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstSpell: UIImageView = {
       let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondSpell: UIImageView = {
       let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let primaryRune: UIImageView = {
       let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12.5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondRune: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12.5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let KDALabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.attributedText = "12 / 0 / 0".setColor(["0"], .lossColor)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let KPLabel: UILabel = {
       let label = UILabel()
        label.text = "K/P 100%"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let gameTypeLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Ranked Solo"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "2019. 11. 27"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemView: StatsItemView = {
       let view = StatsItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    fileprivate func setUpViews(){
        addSubview(statusView)
        addSubview(champImg)
        addSubview(firstSpell)
        addSubview(secondSpell)
        addSubview(primaryRune)
        addSubview(secondRune)
        addSubview(KDALabel)
        addSubview(KPLabel)
        addSubview(gameTypeLabel)
        addSubview(dateLabel)
        addSubview(itemView)
        
        statusView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statusView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        statusView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        champImg.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height * 0.1).isActive = true
        champImg.leftAnchor.constraint(equalTo: statusView.rightAnchor, constant: 8).isActive = true
        champImg.widthAnchor.constraint(equalToConstant: 60).isActive = true
        champImg.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        firstSpell.topAnchor.constraint(equalTo: champImg.topAnchor).isActive = true
        firstSpell.leftAnchor.constraint(equalTo: champImg.rightAnchor, constant: 5).isActive = true
        firstSpell.widthAnchor.constraint(equalToConstant: 25).isActive = true
        firstSpell.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        secondSpell.topAnchor.constraint(equalTo: firstSpell.bottomAnchor, constant: 5).isActive = true
        secondSpell.leftAnchor.constraint(equalTo: firstSpell.leftAnchor).isActive = true
        secondSpell.widthAnchor.constraint(equalToConstant: 25).isActive = true
        secondSpell.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        primaryRune.topAnchor.constraint(equalTo: firstSpell.topAnchor).isActive = true
        primaryRune.leftAnchor.constraint(equalTo: firstSpell.rightAnchor, constant: 5).isActive = true
        primaryRune.widthAnchor.constraint(equalToConstant: 25).isActive = true
        primaryRune.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        secondRune.topAnchor.constraint(equalTo: secondSpell.topAnchor).isActive = true
        secondRune.leftAnchor.constraint(equalTo: primaryRune.leftAnchor).isActive = true
        secondRune.widthAnchor.constraint(equalToConstant: 25).isActive = true
        secondRune.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        KDALabel.topAnchor.constraint(equalTo: champImg.topAnchor, constant: 10).isActive = true
        KDALabel.leftAnchor.constraint(equalTo: primaryRune.rightAnchor, constant: 18).isActive = true
        
        KPLabel.topAnchor.constraint(equalTo: KDALabel.bottomAnchor, constant: 5).isActive = true
        KPLabel.centerXAnchor.constraint(equalTo: KDALabel.centerXAnchor).isActive = true
        
        gameTypeLabel.topAnchor.constraint(equalTo: KDALabel.topAnchor).isActive = true
        gameTypeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        gameTypeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: gameTypeLabel.bottomAnchor, constant: 5).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: gameTypeLabel.rightAnchor).isActive = true
        
        itemView.topAnchor.constraint(equalTo: champImg.bottomAnchor, constant: 5).isActive = true
        itemView.leftAnchor.constraint(equalTo: champImg.leftAnchor).isActive = true
        itemView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
