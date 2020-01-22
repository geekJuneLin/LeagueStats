//
//  UIView+addSubViewVariadic.swift
//  LeagueStats
//
//  Created by Junyu Lin on 22/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

extension UIView{
    
    func addSubView(_ views:UIView...){
        views.forEach({view in
            self.addSubview(view)
        })
    }
}
