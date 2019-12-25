//
//  StatsMainViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 1/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatsMainViewController: UIViewController, cellDelegate{
    //var stauts: [StatusModel] = [StatusModel]()
    var matchList: MatchList?{
        didSet{
            if let matches = matchList {
                DispatchQueue.main.async {
                    self.fetchData(matches: matches) { (status) in
                        self.statsCollectionView.status = status
                        DispatchQueue.main.async {
                            self.statsCollectionView.collectionView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    let topView: StatsTopView = {
       let view = StatsTopView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collection: TierCollectionView = {
       let view = TierCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let statsCollectionView: StatsCollectionView = {
       let cv = StatsCollectionView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        passData()
    }
    
    fileprivate func setUpViews(){
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        
        view.addSubview(topView)
        view.addSubview(collection)
        view.addSubview(statsCollectionView)
        
        statsCollectionView.cellDelegate = self
        
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        topView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        collection.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        collection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collection.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collection.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        statsCollectionView.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 10).isActive = true
        statsCollectionView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        statsCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        statsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    fileprivate func passData(){
        let summonerInfo: SummonerInfoModel = SummonerInfoModel(name: "0x73002", level: 48, tier: "Silver 1", points: 38)
        
        topView.summonerInfo = summonerInfo
    }
    
    fileprivate func fetchData(matches: MatchList, completion: @escaping ([StatusModel]) -> Void){
        guard ClientAPI.shard.getSummonerName() != nil else{
            print("No summoner's name has been found!")
            return
        }
        let name = ClientAPI.shard.getSummonerName()
        var participantId: Int = 0
        var teamId: Int = 0
        
        var status: [StatusModel] = [StatusModel]()
        var index = 0
        matches.match.forEach { (match) in
            if(index == 20) { return }
            index += 1
            ClientAPI.shard.getMatchInfoByID(gameId: match.gameId) { (match) in
                if let data = match {
                    let hour = data.duration / 60
                    let mins = data.duration % 60
                    
                    // find the current summoner's participant id
                    data.participandIds.forEach({ (participant) in
                        if participant.player.name == name{
                            participantId = participant.id
                            return
                        }
                    })
                    
                    teamId = participantId > 5 ? 200 : 100
                    
                    data.teams.forEach({ (team) in
                        if team.teamId == teamId{
                            let win: String = team.win == "Win" ? "W" : "L"
                            status.append(StatusModel(status: win, time: "\(hour):\(mins)"))
                            return
                        }
                    })
                }
                completion(status)
            }
        }
    }
    
    func presentMatchView() {
        let matchViewController = MatchStatsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        present(matchViewController, animated: true, completion: nil)
    }
}
