//
//  StatsMainViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 1/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatsMainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout,cellDelegate{
    let headerId = "headerId"
    var matchList: MatchList?{
        didSet{
            if let matches = matchList {
//                DispatchQueue.main.async {
//                    self.statsCollectionView.isHidden = true
//                }
//                DispatchQueue.main.async {
//                    self.fetchData(matches: matches) { (status) in
//                        self.statsCollectionView.status = status
//                        DispatchQueue.main.async {
//                            self.statsCollectionView.collectionView.reloadData()
//                        }
//                    }
//                }
            }
        }
    }
    
//    let topView: StatsTopView = {
//       let view = StatsTopView()
//        view.backgroundColor = .white
//        view.layer.masksToBounds = true
//        view.layer.cornerRadius = 10
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    let collection: TierCollectionView = {
//       let view = TierCollectionView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    let statsCollectionView: StatsCollectionView = {
//       let cv = StatsCollectionView()
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        return cv
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 0
        }
        return (matchList?.match.count ?? 0) + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierCell", for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! StatsTopView
            let summonerInfo: SummonerInfoModel = SummonerInfoModel(name: "0x73002", level: 48, tier: "Silver 1", points: 38)
            header.summonerInfo = summonerInfo
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        return CGSize(width: self.collectionView.frame.width * 0.8, height: self.collectionView.frame.height * 0.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0{
            return CGSize(width: self.collectionView.frame.width, height: 90)
        }
        return CGSize(width: self.collectionView.frame.width, height: 20)
    }
    
    fileprivate func setUpViews(){
        collectionView.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(TierCollectionView.self, forCellWithReuseIdentifier: "tierCell")
        collectionView.register(StatsTopView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
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
//            if(index == 5) { return }
//            index += 1
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
