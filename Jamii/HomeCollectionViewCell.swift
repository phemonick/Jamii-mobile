//
//  HomeCollectionViewCell.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 26/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit

class HomeCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet weak var containerView : UIView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var locationLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    
    var event : EventData?{
        didSet{
            if let event = event{
                titleLabel.text = event.title
                descriptionLabel.text = event.payloadDescription
                locationLabel.text = event.eventLocation
                dateLabel.text = event.eventDate
            }

        }
    }

    
}
