//
//  mainTableViewCell.swift
//  shudderApp
//
//  Created by User on 1/29/19.
//  Copyright © 2019 jonathanking. All rights reserved.
//

import UIKit

class FeaturedTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var imageUrlArray = [String]()
    var didPullImages = false
    var cellSize = CGSize(width: 123, height: 167)
    
    var section: Int? {
        didSet {
            if !didPullImages {
               flickrPullRequest()
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // *MARK CollectionView Delegates
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    let collectionViewreuseIdentifier = "collectionViewCell"
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrlArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewreuseIdentifier, for: indexPath) as! FeaturedCollectionViewCell
        cell.imageUrl = imageUrlArray[indexPath.item]
        cell.dropShadow()
        cell.roundCorners() 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if section == 1 {
            return FeaturedViewController.sizeForCell!
            
        }
        return cellSize
    }
    
  
    
 

}
