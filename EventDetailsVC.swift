//
//  EventDetailsVC.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 27/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit

class EventDetailsVC : UIViewController{
    
    @IBOutlet weak var detailsView : UIView!
    @IBOutlet weak var dateLabel : UILabel!

    @IBOutlet weak var attendingCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews(){
        detailsView.elevate()
        detailsView.clipsToBounds = true
        detailsView.layer.cornerRadius = 10
        detailsView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        dateLabel.layer.cornerRadius = 10
        dateLabel.layer.masksToBounds = true
        
    }
}


extension EventDetailsVC : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "attendingCell", for: indexPath)
        return cell
    }
    
}
