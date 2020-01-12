//
//  MatchStatsCell.swift
//  LeagueStats
//
//  Created by Junyu Lin on 30/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class MatchStatsCell: UICollectionViewCell{
    
    let uri_origin = "https://ddragon.leagueoflegends.com/cdn/9.24.2/img/"
    
    var matchStatsCellViewModel: MatchStatsCellViewModel!{
        didSet{
            // highlight the summoner being searched
            if matchStatsCellViewModel.summonerName == ClientAPI.shard.getSummonerName(){
                searchedInicator.backgroundColor = .searchedColor
                backgroundColor = .searchedBackground
            }
            
            champImg.loadImgWithUrl(uri_origin + "champion/\(matchStatsCellViewModel.champImg).png", "\(matchStatsCellViewModel.champImg).png")
            levelLabel.text = matchStatsCellViewModel.champLevel
            spellOne.loadImgWithUrl(uri_origin + "spell/\(matchStatsCellViewModel.spell1).png", "\(matchStatsCellViewModel.spell1).png")
            spellTwo.loadImgWithUrl(uri_origin + "spell/\(matchStatsCellViewModel.spell2).png", "\(matchStatsCellViewModel.spell2).png")
            summonerName.text = matchStatsCellViewModel.summonerName
            kdaLabel.attributedText = matchStatsCellViewModel.kdaLabel
            kdaRatio.text = matchStatsCellViewModel.kdaRatio
            itemOne.loadImgWithUrl(uri_origin + "item/\(matchStatsCellViewModel.item1).png", "\(matchStatsCellViewModel.item1).png")
            itemTwo.loadImgWithUrl(uri_origin + "item/\(matchStatsCellViewModel.item2).png", "\(matchStatsCellViewModel.item2).png")
            itemThree.loadImgWithUrl(uri_origin + "item/\(matchStatsCellViewModel.item3).png", "\(matchStatsCellViewModel.item3).png")
            itemFour.loadImgWithUrl(uri_origin + "item/\(matchStatsCellViewModel.item4).png", "\(matchStatsCellViewModel.item4).png")
            itemFive.loadImgWithUrl(uri_origin + "item/\(matchStatsCellViewModel.item5).png", "\(matchStatsCellViewModel.item5).png")
            itemSix.loadImgWithUrl(uri_origin + "item/\(matchStatsCellViewModel.item6).png", "\(matchStatsCellViewModel.item6).png")
            itemSeven.loadImgWithUrl(uri_origin + "item/\(matchStatsCellViewModel.item7).png", "\(matchStatsCellViewModel.item7).png")
            minionsGoldLabel.text = matchStatsCellViewModel.minionsGoldLabel
            damageBar.damages = matchStatsCellViewModel.dmage
            damageBar.dmgLabel.text = matchStatsCellViewModel.dmgLabel
        }
    }
    
    let searchedInicator: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let champImg: UIImageView = {
       let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 19
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let levelLabel: UILabel = {
       let label = UILabel()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 6
        label.backgroundColor = .black
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "48"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spellOne: UIImageView = {
       let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 2
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let spellTwo: UIImageView = {
       let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 2
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let runeOne: UIImageView = {
       let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 9
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let runeTwo: UIImageView = {
       let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 9
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tierLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.backgroundColor = .gray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 2
        label.text = " S1 "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let summonerName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.text = "0x73002"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let kdaLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.attributedText = "0 / 4 / 10".setColor(["4"], .lossColor)
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let kdaRatio: UILabel = {
       let label = UILabel()
//        label.text = "2.50:1"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemOne: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "dinosaur")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemTwo: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "dinosaur")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemThree: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "dinosaur")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemFour: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "dinosaur")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemFive: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "dinosaur")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemSix: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "dinosaur")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemSeven: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "dinosaur")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let minionsGoldLabel: UILabel = {
       let label = UILabel()
        label.text = "125(4.4) / 7.3k"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let damageBar: DamageBar = {
        let bar = DamageBar()
        bar.layer.masksToBounds = true
        bar.layer.cornerRadius = 3
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpViews(){
        addSubview(searchedInicator)
        searchedInicator.anchors(left: leftAnchor, width: widthAnchor, widthValue: 0.01, height: heightAnchor,  heightValue: 1)
        
        addSubview(champImg)
        champImg.anchors(centerY: centerYAnchor, left: leftAnchor, leftConstant: 8, widthValue: 38, heightValue: 38)
        
        addSubview(levelLabel)
        levelLabel.anchors(bottom: champImg.bottomAnchor, right: champImg.rightAnchor)
        
        addSubview(spellOne)
        spellOne.anchors(top: champImg.topAnchor, left: champImg.rightAnchor, leftConstant: 4, widthValue: 18, heightValue: 18)
        
        addSubview(spellTwo)
        spellTwo.anchors(bottom: champImg.bottomAnchor, left: spellOne.leftAnchor, widthValue: 18, heightValue: 18)
        
        
        addSubview(runeOne)
        runeOne.anchors(top: champImg.topAnchor, left: spellOne.rightAnchor, leftConstant: 2, widthValue: 18, heightValue: 18)
        
        addSubview(runeTwo)
        runeTwo.anchors(bottom: champImg.bottomAnchor, left: runeOne.leftAnchor, widthValue: 18, heightValue: 18)

        addSubview(tierLabel)
        tierLabel.anchors(top: runeOne.topAnchor, left: runeOne.rightAnchor, leftConstant: 2)
        
        addSubview(summonerName)
        summonerName.anchors(top: tierLabel.topAnchor, left: tierLabel.rightAnchor, leftConstant: 2)
        
        addSubview(kdaLabel)
        kdaLabel.anchors(bottom: runeTwo.bottomAnchor, left: runeTwo.rightAnchor, leftConstant: 2)

        addSubview(kdaRatio)
        kdaRatio.anchors(bottom: kdaLabel.bottomAnchor, left: kdaLabel.rightAnchor, leftConstant: 2)
        
        addSubview(itemSeven)
        itemSeven.anchors(top: topAnchor, topConstant: 4, right: rightAnchor, rightConstant: -4, widthValue: 20, heightValue: 20)
        
        addSubview(itemSix)
        itemSix.anchors(top: itemSeven.topAnchor, right: itemSeven.leftAnchor, rightConstant: -2, widthValue: 20, heightValue: 20)
        
        addSubview(itemFive)
        itemFive.anchors(top: itemSeven.topAnchor, right: itemSix.leftAnchor, rightConstant: -2, widthValue: 20, heightValue: 20)
        
        addSubview(itemFour)
        itemFour.anchors(top: itemSeven.topAnchor, right: itemFive.leftAnchor, rightConstant: -2, widthValue: 20, heightValue: 20)
        
        addSubview(itemThree)
        itemThree.anchors(top: itemSeven.topAnchor, right: itemFour.leftAnchor, rightConstant: -2, widthValue: 20, heightValue: 20)
        
        addSubview(itemTwo)
        itemTwo.anchors(top: itemSeven.topAnchor, right: itemThree.leftAnchor, rightConstant: -2, widthValue: 20, heightValue: 20)
        
        addSubview(itemOne)
        itemOne.anchors(top: itemSeven.topAnchor, right: itemTwo.leftAnchor, rightConstant: -2, widthValue: 20, heightValue: 20)
        
        addSubview(minionsGoldLabel)
        minionsGoldLabel.anchors(bottom: kdaRatio.bottomAnchor, left: itemOne.leftAnchor)
        
        addSubview(damageBar)
        damageBar.anchors(top: itemSix.bottomAnchor, topConstant: 8, bottom: kdaRatio.bottomAnchor, left: itemFive.leftAnchor, right: itemSeven.rightAnchor)
    }
}
