//
//  ViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 28/11/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, cardViewDelegate {
    
    let mainView: GUI = {
       let view = GUI()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cardView: CardView = {
       let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    let api: ClientAPI = {
//        let api = ClientAPI(API: "RGAPI-0599572c-eafd-4c9b-b48f-36cb67895ed4")
//        return api
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // API Test
        ClientAPI.shard.setApiKey("RGAPI-843f106f-2e91-4b99-b9b4-a839d6faf050")
        ClientAPI.shard.getSummonerByName(value: "0x73002")
        
        setUpViews()
    }
    
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
        
    }
    
    @objc fileprivate func handleClick(){
        print("Card view clicked!")
        let viewController = StatsViewNaviController()
//        ClientAPI.shard.getMatcheList { (matches) in
//            if let matchList = matches{
//                viewController.matchList = matchList
//            }else{
//                print("ViewController hasn't got the match list")
//            }
//        }
        viewController.cardDelegate = self
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    func recoverCardView() {
        print("recovering")
    }
}

extension ViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return EnlargeTransitioning()
    }
}

