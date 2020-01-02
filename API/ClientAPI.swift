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
                //print(match.participants[0].stats)
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
    
    func getChampNameById(_ id: Int) -> String{
        switch(id){
            case 266: return "Aatrox"
            case 412: return "Thresh"
            case 23: return "Tryndamere"
            case 79: return "Gragas"
            case 69: return "Cassiopeia"
            case 136: return "AurelionSol"
            case 13: return "Ryze"
            case 78: return "Poppy"
            case 14: return "Sion"
            case 1: return "Annie"
            case 202: return "Jhin"
            case 43: return "Karma"
            case 111: return "Nautilus"
            case 240: return "Kled"
            case 99: return "Lux"
            case 103: return "Ahri"
            case 2: return "Olaf"
            case 112: return "Viktor"
            case 34: return "Anivia"
            case 27: return "Singed"
            case 86: return "Garen"
            case 127: return "Lissandra"
            case 57: return "Maokai"
            case 25: return "Morgana"
            case 28: return "Evelynn"
            case 105: return "Fizz"
            case 74: return "Heimerdinger"
            case 238: return "Zed"
            case 68: return "Rumble"
            case 82: return "Mordekaiser"
            case 37: return "Sona"
            case 96: return "KogMaw"
            case 55: return "Katarina"
            case 117: return "Lulu"
            case 22: return "Ashe"
            case 30: return "Karthus"
            case 12: return "Alistar"
            case 122: return "Darius"
            case 67: return "Vayne"
            case 110: return "Varus"
            case 77: return "Udyr"
            case 89: return "Leona"
            case 126: return "Jayce"
            case 134: return "Syndra"
            case 80: return "Pantheon"
            case 92: return "Riven"
            case 121: return "Khazix"
            case 42: return "Corki"
            case 268: return "Azir"
            case 51: return "Caitlyn"
            case 76: return "Nidalee"
            case 85: return "Kennen"
            case 3: return "Galio"
            case 45: return "Veigar"
            case 432: return "Bard"
            case 150: return "Gnar"
            case 90: return "Malzahar"
            case 104: return "Graves"
            case 254: return "Vi"
            case 10: return "Kayle"
            case 39: return "Irelia"
            case 64: return "LeeSin"
            case 420: return "Illaoi"
            case 60: return "Elise"
            case 106: return "Volibear"
            case 20: return "Nunu"
            case 4: return "TwistedFate"
            case 24: return "Jax"
            case 102: return "Shyvana"
            case 429: return "Kalista"
            case 36: return "DrMundo"
            case 427: return "Ivern"
            case 131: return "Diana"
            case 223: return "TahmKench"
            case 63: return "Brand"
            case 113: return "Sejuani"
            case 8: return "Vladimir"
            case 154: return "Zac"
            case 421: return "RekSai"
            case 133: return "Quinn"
            case 84: return "Akali"
            case 163: return "Taliyah"
            case 18: return "Tristana"
            case 120: return "Hecarim"
            case 15: return "Sivir"
            case 236: return "Lucian"
            case 107: return "Rengar"
            case 19: return "Warwick"
            case 72: return "Skarner"
            case 54: return "Malphite"
            case 157: return "Yasuo"
            case 101: return "Xerath"
            case 17: return "Teemo"
            case 75: return "Nasus"
            case 58: return "Renekton"
            case 119: return "Draven"
            case 35: return "Shaco"
            case 50: return "Swain"
            case 91: return "Talon"
            case 40: return "Janna"
            case 115: return "Ziggs"
            case 245: return "Ekko"
            case 61: return "Orianna"
            case 114: return "Fiora"
            case 9: return "Fiddlesticks"
            case 31: return "Chogath"
            case 33: return "Rammus"
            case 7: return "LeBlanc"
            case 16: return "Soraka"
            case 26: return "Zilean"
            case 56: return "Nocturne"
            case 222: return "Jinx"
            case 83: return "Yorick"
            case 6: return "Urgot"
            case 203: return "Kindred"
            case 21: return "MissFortune"
            case 62: return "Wukong"
            case 53: return "Blitzcrank"
            case 98: return "Shen"
            case 201: return "Braum"
            case 5: return "XinZhao"
            case 29: return "Twitch"
            case 11: return "MasterYi"
            case 44: return "Taric"
            case 32: return "Amumu"
            case 41: return "Gangplank"
            case 48: return "Trundle"
            case 38: return "Kassadin"
            case 161: return "Velkoz"
            case 143: return "Zyra"
            case 267: return "Nami"
            case 59: return "JarvanIV"
            case 81: return "Ezreal"
            case 145: return "Kaisa"
        default:
            return ""
        }
    }
}
