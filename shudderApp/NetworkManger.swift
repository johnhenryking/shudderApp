//
//  NetworkManger.swift
//  shudderApp
//
//  Created by User on 1/29/19.
//  Copyright © 2019 jonathanking. All rights reserved.
//

import UIKit

extension FeaturedTableViewCell {
    
    func flickrPullRequest() {
        
        
        let jsonUrlString = "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=" + AppDelegate.apiKey + "&per_page=25&format=json&nojsoncallback=1&)"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
                let photosDic = json["photos"] as! [String:Any]
                let photosDicArray = photosDic["photo"] as! [[String:Any]]
                
                photosDicArray.forEach({ (photo) in
                    
                    let postUrl = "https://farm\(photo["farm"]!).staticflickr.com/\(photo["server"]!)/\(photo["id"]!)_\(photo["secret"]!)_h_d.jpg"
                    
                    self.imageUrlArray.append(postUrl)
                    
                })
                
                DispatchQueue.main.async {
                    self.imageUrlArray.shuffle()
                    self.collectionView.reloadData()
                    self.didPullImages = true
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
    
    
    
}
