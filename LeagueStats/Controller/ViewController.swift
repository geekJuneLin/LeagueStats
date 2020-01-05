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
    
    var isTapping = false
    
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
    
    let nameText: UITextField = {
        let text = UITextField()
        text.placeholder = "Please enter the name"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
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
        ClientAPI.shard.setApiKey("RGAPI-fbf64f7a-a3e8-47c0-b63d-b8f168cd1050")
        ClientAPI.shard.getSummonerByName(value: "0x73002")
        setUpViews()
        
        // register UITapGestuer which can detect whether the users finish tapping in the UITextfield
        setUpTapReconizer()
    }
    
    
}

// MARK: - other functions
extension ViewController{
    /// set up all the views
    fileprivate func setUpViews(){
        view.backgroundColor = .white
        
        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleClick)))
        
        view.addSubview(nameLabel)
        view.addSubview(nameText)
        view.addSubview(heroImg)
        view.addSubview(cardView)
        
        heroImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heroImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        heroImg.widthAnchor.constraint(equalToConstant: 80).isActive = true
        heroImg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: heroImg.bottomAnchor, constant: 20).isActive = true
        
        nameText.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 5).isActive = true
        nameText.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 60).isActive = true
        cardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        self.loadImg()
    }
    
    fileprivate func setUpTapReconizer(){
        nameText.delegate = self
        let tapReconizer = UITapGestureRecognizer(target: self, action: #selector(handleDismissKeyBoard))
        view.addGestureRecognizer(tapReconizer)
    }
    
    @objc
    fileprivate func handleDismissKeyBoard(){
        if isTapping{
            view.endEditing(true)
        }
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
            self.cardView.avator.loadImgWithUrl("https://avatar.leagueoflegends.com/oce/0x73002.png", "0x73002.png")
            self.cardView.hideSkeleton()
        }
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameText{
            if !isTapping{
                isTapping = !isTapping
            }
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

