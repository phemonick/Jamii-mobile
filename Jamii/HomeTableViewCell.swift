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
    var vc : UIViewController!
    var event : Event?{
        didSet{
            homeCollectionView.reloadData()
        }
    }
    @IBOutlet weak var eventType: UILabel!

    
    
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
        return event?.payload?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.elevate()
//        cell.event = event?.payload?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vc.performSegue(withIdentifier: "ToDetailsVC", sender: nil)
    }
    
}
