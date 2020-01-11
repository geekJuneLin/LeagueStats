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
        label.textColor = .black
        label.text = "Summoner ID: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameText: UITextField = {
        let text = UITextField()
        text.textColor = .black
        text.attributedPlaceholder = NSAttributedString(string: "Please enter the name", attributes: [.foregroundColor : UIColor.winColor])
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let cardView: CardView = {
       let view = CardView()
        view.isSkeletonable = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewAboveKB: SearcheButtonAboveKB = {
       let view = SearcheButtonAboveKB()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private var isMenuPresented = false
    
    let menuView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var leftButton = UIBarButtonItem()
    private var rightButton = UIBarButtonItem()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.showAnimatedSkeleton()
        setUpNavigationController()
        setUpViews()
        setUpTapReconizer()
        setUpViewAboveKB()
    }
}

// MARK: - other functions
extension ViewController{
    
    @objc
    fileprivate func handleRightButton(){
        print("right button has been pressed")
    }
    
    @objc
    fileprivate func handleLeftButton(){
        print("left button pressed")
        self.isMenuPresented.toggle()
        UIView.animate(withDuration: 0.5) {
            self.menuView.transform = CGAffineTransform(translationX: self.isMenuPresented ? UIScreen.main.bounds.width * 0.25 : -UIScreen.main.bounds.width * 0.25, y: 0)
            self.tabBarController?.view.transform = CGAffineTransform(translationX: self.isMenuPresented ? UIScreen.main.bounds.width * 0.25 : 0, y: 0)
        }
    }
    
    /// init left and right buttons
    fileprivate func setupUIBarButtons(){
        if #available(iOS 13.0, *) {
            let img = UIImage(systemName: "line.horizontal.3.decrease")
            img?.withRenderingMode(.alwaysTemplate)
            img?.withTintColor(.winColor)
            leftButton.image = img
            leftButton.target = self
            leftButton.action = #selector(handleLeftButton)
        } else {
            // Fallback on earlier versions
            leftButton = UIBarButtonItem(title: "More", style: .plain, target: self, action: #selector(handleLeftButton))
        }
        
        if #available(iOS 13.0, *) {
            let img = UIImage(systemName: "ellipsis")
            img?.withRenderingMode(.alwaysTemplate)
            img?.withTintColor(.winColor)
            rightButton.image = img
            rightButton.target = self
            rightButton.action = #selector(handleRightButton)
        } else {
            // Fallback on earlier versions
            rightButton = UIBarButtonItem(title: "More", style: .plain, target: self, action: #selector(handleRightButton))
        }
    }
    
    
    /// set up navigation bar title and left and right buttons
    fileprivate func setUpNavigationController(){
        setupUIBarButtons()
        
        navigationController?.navigationBar.topItem?.title = "League of Legends"
        navigationController?.navigationBar.topItem?.leftBarButtonItem = leftButton
        navigationController?.navigationBar.topItem?.rightBarButtonItem = rightButton
    }
    
    fileprivate func setUpViewAboveKB(){
        viewAboveKB.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissKeyBoard)))
        
        nameText.inputAccessoryView = viewAboveKB
        viewAboveKB.bounds = CGRect(x: 0, y: 0, width: view.bounds.width, height: 40)
    }
    
    /// set up all the views
    fileprivate func setUpViews(){
        view.backgroundColor = .white
        
        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleClick)))
        
        view.addSubview(nameLabel)
        view.addSubview(nameText)
        view.addSubview(heroImg)
        view.addSubview(cardView)
        view.addSubview(menuView)
        
        menuView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -UIScreen.main.bounds.width * 0.25).isActive = true
        
        heroImg.anchors(centerX: view.centerXAnchor, XConstant: 0, centerY: nil, YConstant: 0, top: view.safeAreaLayoutGuide.topAnchor, topConstant: 15, widthValue: 80, heightValue: 50)
        
        nameLabel.anchors(top: heroImg.bottomAnchor, topConstant: 20, left: view.safeAreaLayoutGuide.leftAnchor, leftConstant: 20)
        
        nameText.anchors(top: nameLabel.topAnchor, topConstant: 0, left: nameLabel.rightAnchor, rightConstant: 5)
        
        cardView.anchors(centerX: view.centerXAnchor, top: nameText.bottomAnchor, topConstant: 60, width: view.widthAnchor, widthValue: 0.9, height: view.heightAnchor, heightValue: 0.2)
    }
    
    fileprivate func setUpTapReconizer(){
        nameText.delegate = self
        let tapReconizer = UITapGestureRecognizer(target: self, action: #selector(handleDismissKeyBoard))
        view.addGestureRecognizer(tapReconizer)
    }
    
    fileprivate func getSummonerInfo(_ name: String){
        ClientAPI.shard.getSummonerByName(value: name, completion: {
            self.cardView.summoner = ClientAPI.shard.getSummoner()
            ClientAPI.shard.getSummonerInfo { (entries) in
                self.cardView.entries = entries
            }
        })
        cardView.hideSkeleton()
    }
    
    @objc
    fileprivate func handleDismissKeyBoard(){
        if isTapping{
            if let name = nameText.text {
                nameText.text = ""
                getSummonerInfo(name)
            }
            let impact = UIImpactFeedbackGenerator(style: .medium)
            impact.prepare()
            impact.impactOccurred()
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
}

// MARK: - UITextFieldDelegate
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

