//
//  StatsMainViewController.swift
//  LeagueStats
//
//  Created by Junyu Lin on 1/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

class StatsMainViewController: UICollectionViewController{
    
    // MARK: - variables
    let headerId = "headerId"
    
    var refreshFlag = false
    
    var showImg = false
    
    var statsViewCellModel: [StatsViewCellModel] = [StatsViewCellModel]()
    
    var matchList: MatchList?
    
    var participantIds: [ParticipantId] = [ParticipantId]()
    var participants: [Participant] = [Participant]()
    var matchStats: [MatchStats] = [MatchStats]()
    
    let imageView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
       return view
    }()
    
    let avatorImg: UIImageView = {
       let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.loadImgWithUrl("https://avatar.leagueoflegends.com/oce/0x73002.png", "0x73002.png")
        return view
    }()

    
    let loadingView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = .white
        view.alpha = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let indicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        return view
    }()
    
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ClientAPI.shard.getMatcheList { (matches) in
            if let matches = matches{
                self.matchList = matches
            }
        }
    }
    
    // MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.global(qos: .background).async {
            self.fetchData {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    self.collectionView.reloadData()
                    self.loadingView.removeFromSuperview()
                    self.indicator.stopAnimating()
                })
            }
        }
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpViews()
        setUpProgressIndicator()
    }
}

// MARK: - other functions
extension StatsMainViewController{
    
    
    /// set up progress indicator
    fileprivate func setUpProgressIndicator(){
        self.view.addSubview(loadingView)
        self.view.addSubview(indicator)
        indicator.hidesWhenStopped = true
        indicator.center = self.view.center
        indicator.startAnimating()
    }
    
    
    /// set up navigation controller
    fileprivate func setUpNavigationBar(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        imageView.addSubview(avatorImg)
        
        avatorImg.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatorImg.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatorImg.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        navigationController?.navigationBar.topItem?.titleView = imageView
        navigationController?.navigationBar.barTintColor = .white
        avatorImg.isHidden = true
    }
    
    /// set up views
    fileprivate func setUpViews(){
        collectionView.backgroundColor = .backgroudColor
        collectionView.register(StatsViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(TierCollectionView.self, forCellWithReuseIdentifier: "tierCell")
        collectionView.register(StatsTopView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(BottomRefresh.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerId")
    }
    
    
    /// fetch match list data
    /// - Parameter completion: the code will be executed after done fetching
    fileprivate func fetchData(completion: @escaping ()->Void){
        let name = ClientAPI.shard.getSummonerName()
        var teamId = 0
        var participantId = 0
        DispatchQueue.main.async {
            self.matchList?.match.forEach({ (match) in
                ClientAPI.shard.getMatchInfoByID(gameId: match.gameId) { (matchSearched) in
                    if let data = matchSearched {
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
                        var st: Stats?
                        var totalKill: Int = 0
                        var parti: Participant?
                        
                        // pack all summoners'info here
                        for i in 0..<data.participandIds.count{
                            self.participantIds.append(data.participandIds[i])
                            self.participants.append(data.participants[i])
                        }
                        self.matchStats.append(MatchStats(participantIDs: self.participantIds,
                                                          participants: self.participants,
                                                          date: self.getDateFromTimestamp(match.timestamp),
                                                          time: hour,
                                                          teams: data.teams))
                        self.matchStats = self.matchStats.sorted(by: {
                            $0.date > $1.date
                        })
                        self.participantIds.removeAll()
                        self.participants.removeAll()
                        
                    
                        data.participants.forEach({ (participant) in
                            if participant.participantId == participantId{
                                st = participant.stats
                                parti = participant
                            }
                            if teamId == participant.teamId{
                                totalKill += participant.stats.kills
                            }
                        })
                        if let stat = st {
                            self.statsViewCellModel.append(StatsViewCellModel(StatusModel(stats: stat,
                                                                                          time: "\(hour):\(mins)",
                                totalKill: totalKill,
                                spell1Id: parti!.spell1Id,
                                spell2Id: parti!.spell2Id,
                                championName: ClientAPI.shard.getChampNameById(parti!.championId),
                                queueId: data.queueId,
                                date: self.getDateFromTimestamp(match.timestamp))))
                            self.statsViewCellModel = self.statsViewCellModel.sorted(by: {
                                $0.gameDate > $1.gameDate
                            })
                        }
                    }
            }
          })
            print("status count: \(self.statsViewCellModel.count)")
            completion()
        }
        
    }
    
    func getDateFromTimestamp(_ stamp: Float64) -> String{
        let date = Date(timeIntervalSince1970: stamp / 1000)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd" //Specify your format that you want
        return dateFormatter.string(from: date)
    }
}

// MARK: - data source delegate
extension StatsMainViewController{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // number of items for each section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 0
        }else if section == 1 && refreshFlag{
            return (statsViewCellModel.count) + 2
        }
        return statsViewCellModel.count + 1
    }
    
    // cell at each row
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tierCell", for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StatsViewCell
        cell.backgroundColor = .white
        if indexPath.item < statsViewCellModel.count{
            cell.statsViewCellModel = statsViewCellModel[indexPath.item]
            cell.matchStats = matchStats[indexPath.item]
        }
        return cell
    }
    
    // Header, footer
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! StatsTopView
            let summonerInfo: SummonerInfoModel = SummonerInfoModel(name: "0x73002", level: 48, tier: "Silver 1", points: 38)
            header.summonerInfo = summonerInfo
            return header
        }
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerId", for: indexPath) as! BottomRefresh
        footer.indicator.startAnimating()
        return footer
    }
    
    // scroll method for scrollView
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let height = scrollView.contentSize.height
        
        // check if the summoner's info card view has been scrolled off the screen
        if offsetY > (UIScreen.main.bounds.height * 0.15) && !showImg{
            showImg = true
            UIView.animate(withDuration: 0.5) {
                self.avatorImg.isHidden = false
            }
            
            print("display it on the nav bar")
        }
        if  offsetY < (UIScreen.main.bounds.height * 0.15) && showImg{
            showImg = false
            UIView.animate(withDuration: 0.5) {
                self.avatorImg.isHidden = true
            }
            print("hide the img on the nav bar")
        }
        if height > 0 && offsetY > height - scrollView.frame.height{
            refreshFlag = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.collectionView.reloadData()
            }
            refreshFlag = false
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StatsMainViewController: UICollectionViewDelegateFlowLayout{
    
    // header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        return CGSize(width: self.collectionView.frame.width * 0.8, height: self.collectionView.frame.height * 0.25)
    }
    
    // Footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0{
            return .zero
        }
        return CGSize(width: self.collectionView.frame.width, height: 25)
    }
    
    // size for cell items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0{
            return CGSize(width: self.collectionView.frame.width, height: 90)
        }
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height * 0.15)
    }
    
    // minimum spacing for cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // collectionView didSelectItem method
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked the \(indexPath.item) cell")
        self.presentMatchView(statsViewCellModel[indexPath.item].win, matchStats[indexPath.item])
    }
}

// MARK: - cell clicked Delegate
extension StatsMainViewController: cellDelegate{
    
    /// present the match details of each game in a collectionViewController
    /// - Parameter win: the win state of each match to be displayed in the collectionViewController
    func presentMatchView(_ win: String, _ matchStats: MatchStats) {
        let matchViewController = MatchStatsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let naviController = UINavigationController(rootViewController: matchViewController)
        matchViewController.win = win
        matchViewController.matchStats = matchStats
        present(naviController, animated: true, completion: nil)
    }
}

protocol cellDelegate {
    func presentMatchView(_ win: String, _ matchStats: MatchStats)
}
