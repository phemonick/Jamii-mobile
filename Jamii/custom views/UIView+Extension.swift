//
//  UIView+Extension.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 26/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit


extension UIView{
    func elevate(){
        layer.masksToBounds = false
        layer.shadowColor = Utilities.hexStringToUIColor(hex: "#DDE2EB").cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.shadowRadius = 10
        layer.cornerRadius = 10
        
    }
}
