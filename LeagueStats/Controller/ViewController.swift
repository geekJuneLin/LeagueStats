//
//  ViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 28/11/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit
import SkeletonView

protocol selectServerDelegate{
    func selectedServer(_ name: String)
    func dismiss()
}

class ViewController: UIViewController{
    
    // MARK: - Variables
    
    private var isTapping = false
    
    var isMenuPresented = false
    
    let heroImg: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameText: UITextField = {
        let text = UITextField()
        text.textColor = .black
        text.placeholder = "Search a Summoner"
        text.backgroundColor = .backgroudColor
        text.clipsToBounds = true
        text.layer.cornerRadius = 8
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1))
        text.leftViewMode = .always
        if #available(iOS 13.0, *) {
            let btn = UIImageView(image: UIImage(systemName: "magnifyingglass")?
                .withRenderingMode(.alwaysTemplate))
            btn.tintColor = .placeholderText
            text.rightView = btn
            text.rightViewMode = .always
        } else {
            // Fallback on earlier versions
        }
//        text.attributedPlaceholder = NSAttributedString(string: "Please enter the name", attributes: [.foregroundColor : UIColor.winColor])
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

    

    
    let serverView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        return view
    }()
    
    let serverCollectionView: ServerCollectionView = {
       let view = ServerCollectionView()
        view.backgroundColor = .cyan
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    let launcher = SlideMenuViewLauncher()
    
    private var leftButton = UIBarButtonItem()
    private var rightButton = UIBarButtonItem()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.showAnimatedSkeleton()
        setUpNavigationController()
        setUpViews()
//        setupSlideMenuView()
        setUpTapReconizer()
        setUpViewAboveKB()
    }
}

// MARK: - other functions
extension ViewController{
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
        launcher.mainVC = self
        
        view.backgroundColor = .white
        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleClick)))
        
//        view.addSubview(nameLabel)
        view.addSubview(nameText)
        view.addSubview(heroImg)
        view.addSubview(cardView)
        
        heroImg.anchors(centerX: view.centerXAnchor, top: view.safeAreaLayoutGuide.topAnchor, topConstant: 15, widthValue: 80, heightValue: 50)
        
        nameText.anchors(centerX: view.centerXAnchor, top: heroImg.bottomAnchor, topConstant: 20, width: view.widthAnchor, widthValue: 0.9, heightValue: 35)
        
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
    
    
}

// MARK: - selector functions
extension ViewController{
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
    @objc
    fileprivate func handleClick(){
        print("Card view clicked!")
        let viewController = StatsViewNaviController()

        viewController.cardDelegate = self
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    @objc
    fileprivate func handleRightButton(){
        print("right button has been pressed")
//        let serverController = ServerSelectionViewController()
//        serverController.modalPresentationStyle = .overFullScreen
//        self.present(serverController, animated: true, completion: nil)
        
        if let window = UIApplication.shared.keyWindow{
            window.addSubview(serverView)
            serverView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleServerSelection)))
            serverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            serverView.alpha = 0
            
            window.addSubview(serverCollectionView)
            serverCollectionView.delegate = self
            serverCollectionView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7)
            
            UIView.animate(withDuration: 0.5) {
                self.serverView.alpha = 1
                self.serverCollectionView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.3, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7)
            }
        }
    }
    
    @objc
    fileprivate func handleLeftButton(){
        print("left button pressed")
        isMenuPresented.toggle()
        isMenuPresented ? launcher.showSlideMenuView() : launcher.hideSlideMenuView()
    }
    

    
    @objc
    fileprivate func handleServerSelection(){
        UIView.animate(withDuration: 0.5, animations: {
            self.serverView.alpha = 0
            self.serverCollectionView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7)
        }) { (finished) in
            self.serverView.removeFromSuperview()
        }
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

extension ViewController: selectServerDelegate{
    func selectedServer(_ name: String) {
        print("ViewController select \(name)")
    }
    
    func dismiss() {
        self.handleServerSelection()
    }
}

