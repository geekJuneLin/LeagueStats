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
    
    var matchStats: MatchStats! {
        didSet{
        }
    }
    
    var statsViewCellModel: StatsViewCellModel!{
        didSet{
            statusView.statusLabel.text = statsViewCellModel.win
            statusView.backgroundColor = statsViewCellModel.statusBackgroundColor
            statusView.timeLabel.text = statsViewCellModel.time
            KDALabel.attributedText = statsViewCellModel.kda
            KPLabel.text = statsViewCellModel.kp
            champImg.loadImgWithUrl(uri_origin + "champion/\(statsViewCellModel.champName).png", "\(statsViewCellModel.champName).png")
            firstSpell.loadImgWithUrl(uri_origin + "spell/\(statsViewCellModel.spell1).png", "\(statsViewCellModel.spell1).png")
            secondSpell.loadImgWithUrl(uri_origin + "spell/\(statsViewCellModel.spell2).png", "\(statsViewCellModel.spell2).png")
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
        
        statusView.anchors(left: leftAnchor, widthValue: 45, height: heightAnchor, heightValue: 1)
        
        champImg.anchors(top: topAnchor, topConstant: self.frame.height * 0.1, left: statusView.rightAnchor, leftConstant: 8, widthValue: 60, heightValue: 60)
        
        firstSpell.anchors(top: champImg.topAnchor, left: champImg.rightAnchor, leftConstant: 5, widthValue: 25, heightValue: 25)
        
        secondSpell.anchors(top: firstSpell.bottomAnchor, topConstant: 5, left: firstSpell.leftAnchor, widthValue: 25, heightValue: 25)
        
        primaryRune.anchors(top: firstSpell.topAnchor, left: firstSpell.rightAnchor, leftConstant: 5, widthValue: 25, heightValue: 25)
        
        secondRune.anchors(top: secondSpell.topAnchor, left: primaryRune.leftAnchor, widthValue: 25, heightValue: 25)
        
        KDALabel.anchors(top: champImg.topAnchor, topConstant: 10, left: primaryRune.rightAnchor, rightConstant: 18)
        
        KPLabel.anchors(centerX: KDALabel.centerXAnchor, top: KDALabel.bottomAnchor, topConstant: 5)
        
        gameTypeLabel.anchors(top: KDALabel.topAnchor, right: rightAnchor, rightConstant: -10, width: widthAnchor, widthValue: 0.25)
        
        dateLabel.anchors(top: gameTypeLabel.bottomAnchor, topConstant: 5, right: gameTypeLabel.rightAnchor)
        
        itemView.anchors(top: champImg.bottomAnchor, topConstant: 5, bottom: bottomAnchor, bottomConstant: -5, left: champImg.leftAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
