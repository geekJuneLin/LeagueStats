//
//  GUI.swift
//  LeagueStats
//
//  Created by Junyu Lin on 29/11/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class GUI: UIView{
    let heroImg: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Summoner ID: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    let searchView: UIImageView = {
//       let view = UIImageView()
//        let image = UIImage(named: "search")
//        image?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
//        view.image = image
//        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
//        return view
//    }()
    
    let nameText: UITextField = {
        let text = UITextField()
        text.placeholder = "Please enter the name"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
        setupVar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupVar(){
        addSubview(nameLabel)
        addSubview(nameText)
        addSubview(heroImg)
        
        heroImg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        heroImg.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        heroImg.widthAnchor.constraint(equalToConstant: 80).isActive = true
        heroImg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: heroImg.bottomAnchor, constant: 20).isActive = true
        
        nameText.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 5).isActive = true
        nameText.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
    }
    
}
