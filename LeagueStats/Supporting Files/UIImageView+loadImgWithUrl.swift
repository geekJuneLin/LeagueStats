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
    func loadImgWithUrl(_ url: String, _ name: String){
        // get the document directory
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = docDir.appendingPathComponent(name)
        
        // try to load the image from the path first
        if let image = UIImage(contentsOfFile: archiveURL.path){
            self.image = image
            return
        }
        
        // try to download the image from url
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
                
                // try to save the fetched image to local path
                do{
                    try image.pngData()?.write(to: archiveURL)
                }catch{
                    print("Saving image with errors!")
                }
            }
        }).resume()
    }
}
