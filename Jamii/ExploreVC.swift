//
//  ExploreVC.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 27/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit

class ExploreVC: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView : UICollectionView!
    @IBOutlet weak var exploreTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ExploreVC : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCollectionView", for: indexPath)
        return cell
    }
    
    
    
}


extension ExploreVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploretableCell", for: indexPath) as! ExploreTableCell
        cell.containerView.elevate()
        return cell
    }
    
    
    
}
