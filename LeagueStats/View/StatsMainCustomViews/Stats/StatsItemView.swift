//
//  StatsItemView.swift
//  LeagueStats
//
//  Created by Junyu Lin on 5/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

struct ItemImages{
    var id: Int
}

class StatsItemView: UIView{
    
    let url_origin = "https://ddragon.leagueoflegends.com/cdn/9.24.2/img/item/"
    
    var images: [ItemImages]?{
        didSet{
            if let images = images {
                firstItem.loadImgWithUrl(url_origin + "\(images[0].id).png", "\(images[0].id).png")
                secondItem.loadImgWithUrl(url_origin + "\(images[1].id).png", "\(images[1].id).png")
                thirdItem.loadImgWithUrl(url_origin + "\(images[2].id).png", "\(images[2].id).png")
                fourthItem.loadImgWithUrl(url_origin + "\(images[3].id).png", "\(images[3].id).png")
                fifthItem.loadImgWithUrl(url_origin + "\(images[4].id).png", "\(images[4].id).png")
                sixthItem.loadImgWithUrl(url_origin + "\(images[5].id).png", "\(images[5].id).png")
                seventhItem.loadImgWithUrl(url_origin + "\(images[6].id).png", "\(images[6].id).png")
            }
        }
    }
    
    let firstItem: UIImageView = {
       let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondItem: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thirdItem: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fourthItem: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fifthItem: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sixthItem: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let seventhItem: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12.5
        view.image = UIImage(named: "dinosaur")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .cyan
        
        setUpViews()
    }
    
    fileprivate func setUpViews(){
        addSubview(firstItem)
        addSubview(secondItem)
        addSubview(thirdItem)
        addSubview(fourthItem)
        addSubview(fifthItem)
        addSubview(sixthItem)
        addSubview(seventhItem)
        
        firstItem.anchors(top: topAnchor, left: leftAnchor, widthValue: 25, heightValue: 25)
        
        secondItem.anchors(top: firstItem.topAnchor, left: firstItem.rightAnchor, leftConstant: 5, widthValue: 25, heightValue: 25)
        
        thirdItem.anchors(top: topAnchor, left: secondItem.rightAnchor, leftConstant: 5, widthValue: 25, heightValue: 25)
        
        fourthItem.anchors(top: topAnchor, left: thirdItem.rightAnchor, leftConstant: 5, widthValue: 25, heightValue: 25)
        
        fifthItem.anchors(top: topAnchor, left: fourthItem.rightAnchor, leftConstant: 5, widthValue: 25, heightValue: 25)
        
        sixthItem.anchors(top: topAnchor, left: fifthItem.rightAnchor, leftConstant: 5, widthValue: 25, heightValue: 25)

        seventhItem.anchors(top: topAnchor, left: sixthItem.rightAnchor, leftConstant: 5, widthValue: 25, heightValue: 25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
