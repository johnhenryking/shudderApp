//
//  CollectionViewCell.swift
//  shudderApp
//
//  Created by User on 1/29/19.
//  Copyright © 2019 jonathanking. All rights reserved.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: CustomImageView!
    
    var imageUrl: String? {
        didSet {
            updateSecond()
        }
    }
    
    func updateSecond() {
        guard let url = imageUrl else { return }
        photoImageView.loadImage(urlString: url)
        
    }
    
    
}
