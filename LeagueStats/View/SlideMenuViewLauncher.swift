//
//  SlideMenuViewLauncher.swift
//  LeagueStats
//
//  Created by Junyu Lin on 17/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

class SlideMenuViewLauncher: NSObject{
    
    var mainVC: ViewController?
    
    let menuView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 65/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let accountImg: UIButton = {
       let view = UIButton(type: .system)
        if #available(iOS 13.0, *) {
            let img = UIImage(systemName: "person")
            img?.withRenderingMode(.alwaysTemplate)
            view.setImage(img, for: .normal)
            view.isUserInteractionEnabled = true
            view.isEnabled = true
        } else {
            // Fallback on earlier versions
        }
        view.tintColor = UIColor(white: 0.6, alpha: 0.8)
        view.backgroundColor = UIColor(red: 92/255, green: 91/255, blue: 90/255, alpha: 1.0)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let setting: UIButton = {
        let view = UIButton(type: .system)
        if #available(iOS 13.0, *) {
            let img = UIImage(systemName: "wrench")
            img?.withRenderingMode(.alwaysTemplate)
            view.setImage(img, for: .normal)
        } else {
            // Fallback on earlier versions
        }
        view.tintColor = UIColor(white: 0.6, alpha: 0.8)
        view.backgroundColor = UIColor(red: 92/255, green: 91/255, blue: 90/255, alpha: 1.0)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func showSlideMenuView(){
        if let window = UIApplication.shared.keyWindow{
            menuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMenuViewClick)))
            menuView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width * 0.25, y: 0)
            
            window.addSubview(menuView)
            menuView.anchors(left: window.rootViewController!.view.leftAnchor, widthValue: UIScreen.main.bounds.width * 0.25, heightValue: UIScreen.main.bounds.height)
            
            accountImg.addTarget(self, action: #selector(handleAccountImgClick), for: .touchUpInside)
            setting.addTarget(self, action: #selector(handleSettingClick), for: .touchUpInside)
            menuView.addSubview(setting)
            setting.anchors(centerX: menuView.centerXAnchor, bottom: menuView.bottomAnchor, bottomConstant: -10, widthValue: 50, heightValue: 50)
            menuView.addSubview(accountImg)
            accountImg.anchors(centerX: menuView.centerXAnchor, bottom: setting.topAnchor, bottomConstant: -10, widthValue: 50, heightValue: 50)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.mainVC?.tabBarController?.view.transform = CGAffineTransform(translationX: self.mainVC?.isMenuPresented ?? false ? UIScreen.main.bounds.width * 0.25 : 0, y: 0)
                self.menuView.transform = CGAffineTransform(translationX: self.mainVC?.isMenuPresented ?? false ? 0 : -UIScreen.main.bounds.width * 0.25, y: 0)
            }, completion: nil)
        }
    }
    
    func hideSlideMenuView(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.mainVC?.tabBarController?.view.transform = CGAffineTransform(translationX: self.mainVC?.isMenuPresented ?? false ? UIScreen.main.bounds.width * 0.25 : 0, y: 0)
            self.menuView.transform = CGAffineTransform(translationX: self.mainVC?.isMenuPresented ?? false ? 0 : -UIScreen.main.bounds.width * 0.25, y: 0)
        }, completion: nil)
    }
    
    @objc
    fileprivate func handleMenuViewClick(){
        mainVC?.isMenuPresented.toggle()
        hideSlideMenuView()
    }
    
    @objc
    fileprivate func handleAccountImgClick(){
        print("account image pressed!")
    }
    
    @objc
    fileprivate func handleSettingClick(){
        print("setting image pressed!")
    }
}
