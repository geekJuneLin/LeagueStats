//
//  ViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 28/11/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UIViewController{
    
    // MARK: - Variables
    let mainView: GUI = {
       let view = GUI()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cardView: CardView = {
       let view = CardView()
        view.isSkeletonable = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.showAnimatedSkeleton()
        
        // API Test
        ClientAPI.shard.setApiKey("RGAPI-6cb250d5-5460-418b-a43c-e600c6c10e87")
        ClientAPI.shard.getSummonerByName(value: "0x73002")
        setUpViews()
    }
    
    /// set up all the views
    fileprivate func setUpViews(){
        view.backgroundColor = .white
        
        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleClick)))
        
        view.addSubview(mainView)
        mainView.addSubview(cardView)
        
        mainView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.topAnchor.constraint(equalTo: mainView.nameText.bottomAnchor, constant: 60).isActive = true
        cardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        self.loadImg()
    }
    
    /// handle the click event of the card view
    @objc fileprivate func handleClick(){
        print("Card view clicked!")
        let viewController = StatsViewNaviController()

        viewController.cardDelegate = self
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    fileprivate func loadImg(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.cardView.avator.loadImgWithUrl("https://avatar.leagueoflegends.com/oce/0x73002.png")
            self.cardView.hideSkeleton()
        }
    }
}

// MARK: - using cutomized transition animation
extension ViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return EnlargeTransitioning()
    }
}

// MARK: - set cardViewDelegate
extension ViewController: cardViewDelegate{
    func recoverCardView() {
        print("recovering")
    }
}

