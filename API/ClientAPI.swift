//
//  ClientAPI.swift
//  LeagueStats
//
//  Created by Junyu Lin on 29/11/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import Foundation

class ClientAPI{
    // MARK: - variables
    static var shard: ClientAPI = ClientAPI()
    private var name: String?
    private var accountId: String?
    private var API_KEY: String?
    let uri_origin = "https://oc1.api.riotgames.com"
    
    private init(){
        
    }
    
    func setApiKey(_ key: String){
        self.API_KEY = key
    }
    
    // EndPoint
    enum EndPoint: String{
        case FindSummonerByName
        case FindMatchesByAccount
    }
    
    /*
     executeQuery func
     @Para:
     endPoint: which end point you are going to sending request
     value: the parameters value going to be passed in
     completion: this completion block is going to be called when the query has been executed and return the data back
     */
    fileprivate func executeQuery(endPoint: String, value: String, completion: @escaping (Data?) -> Void){
        self.executeQuery(endPoint: endPoint, value: value, query: "", completion: completion)
//        if let key = API_KEY,
//            let url = URL(string: uri_origin + endPoint + value + "?api_key=" + key){
//            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    print("Executing query with errors \(error ?? "Unknow errors" as! Error)")
//                }
//
//                if let data = data {
//                    completion(data)
//                }else{
//                    completion(nil)
//                }
//            }
//            task.resume()
//        }else{
//            print("URL is not valid")
//        }
    }
    
    fileprivate func executeQuery(endPoint: String, value: String, query: String, completion: @escaping (Data?) -> Void){
        if let key = API_KEY,
            let url = URL(string: uri_origin + endPoint + value + "?" + query + "&api_key=" + key){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Executing query with errors \(error)")
                }
                
                if let data = data {
                    completion(data)
                }else{
                    completion(nil)
                }
            }.resume()
        }
    }
    
    /*
     getSummonerByName
     @Para:
     value: the summoner's name
     */
    func getSummonerByName(value: String){
        let decoder = JSONDecoder()
        let end: String = "/lol/summoner/v4/summoners/by-name/"
        
        executeQuery(endPoint: end, value: value) { (data) in
            if let data = data,
                let sm = try? decoder.decode(SummonerInfo.self, from: data){
                print(sm.accountId)
                self.accountId = sm.accountId
                self.name = value
            }
        }
    }
    
    // - TODO: 1. Fix the bug that when call the getMatchList() the getSummonerByName() might be invoked before executing the getMatchList()
    func getMatcheList(completion: @escaping (MatchList?) -> Void){
        if let id = accountId{
            let decoder = JSONDecoder()
            
            let endPoint: String = "/lol/match/v4/matchlists/by-account/"
            
            executeQuery(endPoint: endPoint, value: id) { (data) in
                if let data = data,
                    let matchList = try? decoder.decode(MatchList.self, from: data){
                    completion(matchList)
                }else{
                    completion(nil)
                }
            }
            
        }else{
            print("No account id has been found")
        }
    }
    
    
    /*
     getMatchInfoById func
     @para:
     gameId: game id used to find the detail of the specific match
     completion: this block of code will be called after finishing getting data and successfully convert the data into MatchDetail
     */
    
    func getMatchInfoByID(gameId id: Float64, completion: @escaping (MatchDetail?) -> Void){
        let decoder = JSONDecoder()
        let endPoint = "/lol/match/v4/matches/"
        
        executeQuery(endPoint: endPoint, value: String(format: "%.0f", id)) { (data) in
            if let data = data,
                let match = try? decoder.decode(MatchDetail.self, from: data){
                completion(match)
            }else{
                print("unsuccessfully extract the data")
                completion(nil)
            }
        }
    }
    
    /*
     getSummonerName func
     @Return: the name of the current being searched summoner
     */
    func getSummonerName() -> String? {
        if let summonerName = name {
            return summonerName
        }else{
            return nil
        }
    }
}
