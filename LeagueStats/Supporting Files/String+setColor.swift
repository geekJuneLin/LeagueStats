//
//  String+setColor.swift
//  LeagueStats
//
//  Created by Junyu Lin on 31/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

extension String{
    func setColor(_ str: [String], _ color: UIColor) -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string: self)
        str.forEach { (string) in
            let range = (self as NSString).range(of: string)
            print(range)
            attributedString.addAttributes([.foregroundColor : color], range: range)
        }
        return attributedString
    }
}
