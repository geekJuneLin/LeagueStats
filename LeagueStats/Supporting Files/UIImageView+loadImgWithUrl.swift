//
//  UIImageView+loadImgWithUrl.swift
//  LeagueStats
//
//  Created by Junyu Lin on 29/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

extension UIImageView{
    func loadImgWithUrl(_ url: String){
        guard let url = URL(string: url) else{ return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil else{
                print("Executing url with error \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200,
            let data = data else{
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }).resume()
    }
}
