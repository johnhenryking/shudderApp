//
//  Extensions.swift
//  shudderApp
//
//  Created by User on 1/29/19.
//  Copyright © 2019 jonathanking. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(with imageUrl: String) {
        
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //check for the error, then construct the image using data
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                UIView.transition(with: self,
                                  duration: 0.2,
                                  options: .transitionCrossDissolve,
                                  animations: { self.image = image },
                                  completion: nil)
            }
            
            }.resume()
    }
    
}

extension UIViewController {
    
    func setNavigationBarTitleView(to image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
}

extension UICollectionViewCell {
    
    func setCornerRadius(to newRadius: CGFloat) {
        self.layer.cornerRadius = newRadius
        self.layer.masksToBounds = true
    }
    
    func roundCorners() {
        self.layer.cornerRadius = self.layer.frame.height/12
        self.layer.masksToBounds = true
    }
    
    func dropShadow() {
        
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
    }
    
}

extension FeaturedViewController {
    
    func setSizeForCell() {
       FeaturedViewController.sizeForCell = CGSize(width: self.view.frame.width-40, height: 200)
    }
    
    
}


