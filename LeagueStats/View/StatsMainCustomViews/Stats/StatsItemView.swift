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
        
        firstItem.topAnchor.constraint(equalTo: topAnchor).isActive = true
        firstItem.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        firstItem.widthAnchor.constraint(equalToConstant: 25).isActive = true
        firstItem.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        secondItem.topAnchor.constraint(equalTo: firstItem.topAnchor).isActive = true
        secondItem.leftAnchor.constraint(equalTo: firstItem.rightAnchor, constant: 5).isActive = true
        secondItem.widthAnchor.constraint(equalToConstant: 25).isActive = true
        secondItem.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        thirdItem.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thirdItem.leftAnchor.constraint(equalTo: secondItem.rightAnchor, constant: 5).isActive = true
        thirdItem.widthAnchor.constraint(equalToConstant: 25).isActive = true
        thirdItem.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        fourthItem.topAnchor.constraint(equalTo: topAnchor).isActive = true
        fourthItem.leftAnchor.constraint(equalTo: thirdItem.rightAnchor, constant: 5).isActive = true
        fourthItem.widthAnchor.constraint(equalToConstant: 25).isActive = true
        fourthItem.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        fifthItem.topAnchor.constraint(equalTo: topAnchor).isActive = true
        fifthItem.leftAnchor.constraint(equalTo: fourthItem.rightAnchor, constant: 5).isActive = true
        fifthItem.widthAnchor.constraint(equalToConstant: 25).isActive = true
        fifthItem.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        sixthItem.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sixthItem.leftAnchor.constraint(equalTo: fifthItem.rightAnchor, constant: 5).isActive = true
        sixthItem.widthAnchor.constraint(equalToConstant: 25).isActive = true
        sixthItem.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        seventhItem.topAnchor.constraint(equalTo: topAnchor).isActive = true
        seventhItem.leftAnchor.constraint(equalTo: sixthItem.rightAnchor, constant: 5).isActive = true
        seventhItem.widthAnchor.constraint(equalToConstant: 25).isActive = true
        seventhItem.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
