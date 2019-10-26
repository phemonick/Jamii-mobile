//
//  HomeTableViewCell.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 26/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit

class HomeTableViewCell : UITableViewCell{
    
    @IBOutlet weak var homeCollectionView : UICollectionView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
   
    
    func setupViews(){
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
}


extension HomeTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.elevate()
        return cell
    }
    
}
