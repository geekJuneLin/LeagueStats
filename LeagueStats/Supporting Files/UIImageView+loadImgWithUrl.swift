//
//  UIImageView+loadImgWithUrl.swift
//  LeagueStats
//
//  Created by Junyu Lin on 29/12/19.
//  Copyright © 2019 Junyu Lin. All rights reserved.
//

import UIKit

var cachedImage = NSCache<NSString, UIImage>()

extension UIImageView{
//    func loadImgWithUrl(_ url: String){
//
//    }
    
    func loadImgWithUrl(_ url: String){
        if let image = cachedImage.object(forKey: url as NSString){
            self.image = image
            return
        }
        
        guard let cUrl = URL(string: url) else{ return }
        URLSession.shared.dataTask(with: cUrl, completionHandler: { (data, response, error) in
            guard error == nil else{
                print("Executing url with error \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200,
            let data = data else{
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                self.image = image
                cachedImage.setObject(image, forKey: url as NSString)
            }
        }).resume()
    }
}
