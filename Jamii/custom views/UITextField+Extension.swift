//
//  UITextField+Extension.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 27/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit


extension UITextField{
    
    func getText() -> String{
        return self.text ?? ""
    }
}
