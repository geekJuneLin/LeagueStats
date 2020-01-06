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
        searchedInicator.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.01).isActive = true
        searchedInicator.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        searchedInicator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        addSubview(champImg)
        champImg.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        champImg.widthAnchor.constraint(equalToConstant: 38).isActive = true
        champImg.heightAnchor.constraint(equalToConstant: 38).isActive = true
        champImg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(levelLabel)
        levelLabel.rightAnchor.constraint(equalTo: champImg.rightAnchor).isActive = true
        levelLabel.bottomAnchor.constraint(equalTo: champImg.bottomAnchor).isActive = true
        
        addSubview(spellOne)
        spellOne.widthAnchor.constraint(equalToConstant: 18).isActive = true
        spellOne.heightAnchor.constraint(equalToConstant: 18).isActive = true
        spellOne.topAnchor.constraint(equalTo: champImg.topAnchor).isActive = true
        spellOne.leftAnchor.constraint(equalTo: champImg.rightAnchor, constant: 4).isActive = true
        
        addSubview(spellTwo)
        spellTwo.widthAnchor.constraint(equalToConstant: 18).isActive = true
        spellTwo.heightAnchor.constraint(equalToConstant: 18).isActive = true
        spellTwo.bottomAnchor.constraint(equalTo: champImg.bottomAnchor).isActive = true
        spellTwo.leftAnchor.constraint(equalTo: spellOne.leftAnchor).isActive = true
        
        
        addSubview(runeOne)
        runeOne.widthAnchor.constraint(equalToConstant: 18).isActive = true
        runeOne.heightAnchor.constraint(equalToConstant: 18).isActive = true
        runeOne.topAnchor.constraint(equalTo: champImg.topAnchor).isActive = true
        runeOne.leftAnchor.constraint(equalTo: spellOne.rightAnchor, constant: 2).isActive = true
        
        addSubview(runeTwo)
        runeTwo.widthAnchor.constraint(equalToConstant: 18).isActive = true
        runeTwo.heightAnchor.constraint(equalToConstant: 18).isActive = true
        runeTwo.bottomAnchor.constraint(equalTo: champImg.bottomAnchor).isActive = true
        runeTwo.leftAnchor.constraint(equalTo: runeOne.leftAnchor).isActive = true
        
        addSubview(tierLabel)
        tierLabel.topAnchor.constraint(equalTo: runeOne.topAnchor).isActive = true
        tierLabel.leftAnchor.constraint(equalTo: runeOne.rightAnchor, constant: 2).isActive = true
        
        addSubview(summonerName)
        summonerName.topAnchor.constraint(equalTo: tierLabel.topAnchor).isActive = true
        summonerName.leftAnchor.constraint(equalTo: tierLabel.rightAnchor, constant: 2).isActive = true
        
        addSubview(kdaLabel)
        kdaLabel.leftAnchor.constraint(equalTo: runeTwo.rightAnchor, constant: 2).isActive = true
        kdaLabel.bottomAnchor.constraint(equalTo: runeTwo.bottomAnchor).isActive = true
        
        addSubview(kdaRatio)
        kdaRatio.leftAnchor.constraint(equalTo: kdaLabel.rightAnchor, constant: 2).isActive = true
        kdaRatio.bottomAnchor.constraint(equalTo: kdaLabel.bottomAnchor).isActive = true
        
        addSubview(itemSeven)
        itemSeven.widthAnchor.constraint(equalToConstant: 20).isActive = true
        itemSeven.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemSeven.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        itemSeven.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        
        addSubview(itemSix)
        itemSix.widthAnchor.constraint(equalToConstant: 20).isActive = true
        itemSix.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemSix.rightAnchor.constraint(equalTo: itemSeven.leftAnchor, constant: -2).isActive = true
        itemSix.topAnchor.constraint(equalTo: itemSeven.topAnchor).isActive = true
        
        addSubview(itemFive)
        itemFive.widthAnchor.constraint(equalToConstant: 20).isActive = true
        itemFive.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemFive.rightAnchor.constraint(equalTo: itemSix.leftAnchor, constant: -2).isActive = true
        itemFive.topAnchor.constraint(equalTo: itemSeven.topAnchor).isActive = true
        
        addSubview(itemFour)
        itemFour.widthAnchor.constraint(equalToConstant: 20).isActive = true
        itemFour.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemFour.rightAnchor.constraint(equalTo: itemFive.leftAnchor, constant: -2).isActive = true
        itemFour.topAnchor.constraint(equalTo: itemSeven.topAnchor).isActive = true
        
        addSubview(itemThree)
        itemThree.widthAnchor.constraint(equalToConstant: 20).isActive = true
        itemThree.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemThree.rightAnchor.constraint(equalTo: itemFour.leftAnchor, constant: -2).isActive = true
        itemThree.topAnchor.constraint(equalTo: itemSeven.topAnchor).isActive = true
        
        addSubview(itemTwo)
        itemTwo.widthAnchor.constraint(equalToConstant: 20).isActive = true
        itemTwo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemTwo.rightAnchor.constraint(equalTo: itemThree.leftAnchor, constant: -2).isActive = true
        itemTwo.topAnchor.constraint(equalTo: itemSeven.topAnchor).isActive = true
        
        addSubview(itemOne)
        itemOne.widthAnchor.constraint(equalToConstant: 20).isActive = true
        itemOne.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemOne.rightAnchor.constraint(equalTo: itemTwo.leftAnchor, constant: -2).isActive = true
        itemOne.topAnchor.constraint(equalTo: itemSeven.topAnchor).isActive = true
        
        addSubview(minionsGoldLabel)
        minionsGoldLabel.leftAnchor.constraint(equalTo: itemOne.leftAnchor).isActive = true
        minionsGoldLabel.bottomAnchor.constraint(equalTo: kdaRatio.bottomAnchor).isActive = true
        
        addSubview(damageBar)
        damageBar.rightAnchor.constraint(equalTo: itemSeven.rightAnchor).isActive = true
        damageBar.bottomAnchor.constraint(equalTo: kdaRatio.bottomAnchor).isActive = true
        damageBar.leftAnchor.constraint(equalTo: itemFive.leftAnchor).isActive = true
        damageBar.topAnchor.constraint(equalTo: itemSix.bottomAnchor, constant: 8).isActive = true
    }
}
