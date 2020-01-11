//
//  UIView+AutoLayout.swift
//  LeagueStats
//
//  Created by Junyu Lin on 11/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

extension UIView{
    
    func anchors(centerX: NSLayoutXAxisAnchor? = nil, XConstant: CGFloat = 0, centerY: NSLayoutYAxisAnchor? = nil, YConstant: CGFloat = 0, top: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0, bottom: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat = 0, left: NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat = 0, right: NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat = 0){
        self.setAnchors(centerX: centerX, XConstant: XConstant, centerY: centerY, YConstant: YConstant, top: top, topConstant: topConstant, bottom: bottom, bottomConstant: bottomConstant, left: left, leftConstant: leftConstant, right: right, rightConstant: rightConstant)
    }
    
    fileprivate func setAnchors(centerX: NSLayoutXAxisAnchor? = nil, XConstant: CGFloat = 0, centerY: NSLayoutYAxisAnchor? = nil, YConstant: CGFloat = 0, top: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0, bottom: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat = 0, left: NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat = 0, right: NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat = 0){
        
        let constraints = [centerX != nil ? self.centerXAnchor.constraint(equalTo: centerX!, constant: XConstant): nil,
                           centerY != nil ? self.centerYAnchor.constraint(equalTo: centerY!, constant: YConstant): nil,
                           top != nil ? self.topAnchor.constraint(equalTo: top!, constant: topConstant): nil,
                           bottom != nil ? self.bottomAnchor.constraint(equalTo: bottom!, constant: bottomConstant) : nil,
                           left != nil ? self.leftAnchor.constraint(equalTo: left!, constant: leftConstant) : nil,
                           right != nil ? self.rightAnchor.constraint(equalTo: right!, constant: rightConstant) : nil]
        
        constraints.forEach({
            $0?.isActive = true
        })
    }
    
    func anchors(centerX: NSLayoutXAxisAnchor? = nil, XConstant: CGFloat = 0, centerY: NSLayoutYAxisAnchor? = nil, YConstant: CGFloat = 0, top: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0, bottom: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat = 0, left: NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat = 0, right: NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat = 0, width: NSLayoutDimension? = nil, widthValue: CGFloat = 0, height: NSLayoutDimension? = nil, heightValue: CGFloat = 0){
        self.setAnchors(centerX: centerX, XConstant: XConstant, centerY: centerY, YConstant: YConstant, top: top, topConstant: topConstant, bottom: bottom, bottomConstant: bottomConstant, left: left, leftConstant: leftConstant, right: right, rightConstant: rightConstant, width: width, widthValue: widthValue, height: height, heightValue: heightValue)
    }
    
    fileprivate func setAnchors(centerX: NSLayoutXAxisAnchor? = nil, XConstant: CGFloat = 0, centerY: NSLayoutYAxisAnchor? = nil, YConstant: CGFloat = 0, top: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0, bottom: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat = 0, left: NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat = 0, right: NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat = 0, width: NSLayoutDimension? = nil, widthValue: CGFloat = 0, height: NSLayoutDimension? = nil, heightValue: CGFloat = 0){
        
        let constraints = [centerX != nil ? self.centerXAnchor.constraint(equalTo: centerX!, constant: XConstant): nil,
                           centerY != nil ? self.centerYAnchor.constraint(equalTo: centerY!, constant: YConstant): nil, top != nil ? self.topAnchor.constraint(equalTo: top!, constant: topConstant): nil,
                           bottom != nil ? self.bottomAnchor.constraint(equalTo: bottom!, constant: bottomConstant) : nil,
                           left != nil ? self.leftAnchor.constraint(equalTo: left!, constant: leftConstant) : nil,
                           right != nil ? self.rightAnchor.constraint(equalTo: right!, constant: rightConstant) : nil,
                           width != nil ? self.widthAnchor.constraint(equalTo: width!, multiplier: widthValue) : self.widthAnchor.constraint(equalToConstant: widthValue),
                           height != nil ? self.heightAnchor.constraint(equalTo: height!, multiplier: heightValue) : self.heightAnchor.constraint(equalToConstant: heightValue)]
        
        constraints.forEach({
            $0?.isActive = true
        })
    }
}
