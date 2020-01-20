//
//  ChampionAnalysisSearchHeader.swift
//  LeagueStats
//
//  Created by Junyu Lin on 20/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class ChampionAnalysisSearchHeader: UITableViewHeaderFooterView {
    
    let backgroundV: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let searchBar: UITextField = {
       let bar = UITextField()
        bar.backgroundColor = .backgroudColor
        bar.clipsToBounds = true
        bar.layer.cornerRadius = 8
        bar.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1))
        bar.leftViewMode = .always
        bar.placeholder = "Search a Champion"
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    let favoriteLbl: UILabel = {
       let label = UILabel()
        label.text = "Favorite Champions"
        label.textColor = .winColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpView(){
        self.backgroundView = backgroundV
        
        if #available(iOS 13.0, *) {
            let img = UIImage(systemName: "magnifyingglass")?
                .withRenderingMode(.alwaysTemplate)
            let btn = UIImageView(image: img)
            btn.tintColor = .placeholderText
            searchBar.rightView = btn
            searchBar.rightViewMode = .always
        } else {
            // Fallback on earlier versions
        }
        
        backgroundV.addSubview(searchBar)
        searchBar.anchors(centerX: backgroundV.centerXAnchor, top: backgroundV.topAnchor, width: backgroundV.widthAnchor, widthValue: 0.9, height: backgroundV.heightAnchor, heightValue: 0.2)
        
        backgroundV.addSubview(favoriteLbl)
        favoriteLbl.anchors(top: searchBar.bottomAnchor, topConstant: 5, left: searchBar.leftAnchor)
    }
}
