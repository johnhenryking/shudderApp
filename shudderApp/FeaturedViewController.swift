//
//  ViewController.swift
//  shudderApp
//
//  Created by User on 1/29/19.
//  Copyright © 2019 jonathanking. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static var sizeForCell: CGSize?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSizeForCell()
        self.setNavigationBarTitleView(to: #imageLiteral(resourceName: "shudderLogo-20"))
    }
    
    // *MARK TableView Delegates
    
    let reuseIdentifer = "tableViewCell"
    
    @IBOutlet weak var mainTableView: UITableView! {
        didSet {
            mainTableView.delegate = self
            mainTableView.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! FeaturedTableViewCell
        cell.section = indexPath.item+1
        if indexPath.item == 0 {
            cell.titleLabel.isHidden = true
            cell.collectionViewHeightConstraint.constant = cell.frame.height
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return self.view.frame.height/3
        }
        return UITableView.automaticDimension
    }


}

