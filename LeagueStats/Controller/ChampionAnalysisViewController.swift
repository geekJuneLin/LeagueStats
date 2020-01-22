//
//  ChampionAnalysisViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 17/01/20.
//  Copyright © 2020 Junyu Lin. All rights reserved.
//

import UIKit

protocol DataFromHeaderDelegate {
    func passDataFromHeader(indexPath: IndexPath)
}

protocol DataFromCellDelegate {
    func passDataFromCell(indexPath: IndexPath)
}


class ChampionAnalysisViewController: UIViewController{
    
    let cellId = "cellId"
    let headerSearchId = "headerSearchId"
    let headerTypeId = "headerTypeId"
    
    var isCollapsed = false
    
    var headerDelegate: DataFromHeaderDelegate?
    var cellDelegate: DataFromCellDelegate?
    
    private var leftButton = UIBarButtonItem()
    
    let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: UITableView.Style.plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpNavigationBarButton()
        setUpTableView() 
    }
    
}

// MARK: - other functions
extension ChampionAnalysisViewController{
    
    fileprivate func setUpTableView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ChampionAnalysisSearchHeader.self, forHeaderFooterViewReuseIdentifier: headerSearchId)
        tableView.register(ChampionAnalysisTypeHeader.self, forHeaderFooterViewReuseIdentifier: headerTypeId)
        tableView.register(ChampionAnalysisTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.anchors(width: view.widthAnchor, widthValue: 1, height: view.heightAnchor, heightValue: 1)
    }
    
    fileprivate func setUpNavigationBarButton(){
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
        
        navigationController?.view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.leftBarButtonItem = leftButton
        navigationController?.navigationBar.topItem?.title = "Champion Analysis"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - objc selector function
extension ChampionAnalysisViewController{
    @objc
    fileprivate func handleLeftButton(){
        print("left button pressed")
    }
}

// MARk: - UITableView data source
extension ChampionAnalysisViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // first section
        if section == 0{
            return 1
        }else{ // second section
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChampionAnalysisTableViewCell
            headerDelegate = (cell as DataFromHeaderDelegate)
            cell.delegate = self
            cell.scrollDelegate = self
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension ChampionAnalysisViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerSearchId) as! ChampionAnalysisSearchHeader
            return header
        }else{
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerTypeId) as! ChampionAnalysisTypeHeader
            header.delegate = self
            cellDelegate = (header as DataFromCellDelegate)
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 150
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1{
            return UIScreen.main.bounds.height * 0.8
        }else{
            return 0
        }
    }
}

// MARK: - DataFromHeaderDelegate
extension ChampionAnalysisViewController: DataFromHeaderDelegate{
    func passDataFromHeader(indexPath: IndexPath) {
        print("selected index in header is: \(indexPath.item)")
        self.headerDelegate?.passDataFromHeader(indexPath: indexPath)
    }
}

// MARK: - DataFromCellDelegate
extension ChampionAnalysisViewController: DataFromCellDelegate{
    func passDataFromCell(indexPath: IndexPath){
        print("selected index in cell is: \(indexPath.item)")
        self.cellDelegate?.passDataFromCell(indexPath: indexPath)
    }
}

// MARK: - Champion scroll delegate
extension ChampionAnalysisViewController: ChampionAnalysisScrollDelegate{
    func needToScroll(offsetY: CGFloat) {
        
        if offsetY > 10 && !isCollapsed {
            tableView.scrollToRow(at: IndexPath(item: 0, section: 1), at: .bottom, animated: true)
            isCollapsed.toggle()
        }
        if offsetY < 0 && isCollapsed{
            tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .none, animated: true)
            isCollapsed.toggle()
        }
    }
}
