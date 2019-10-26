//
//  OnboardVC.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 26/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit


class OnboardVC : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTouchGetStarted(_ sender: Any) {
        present(LoginVC(), animated: true, completion: nil)
    }
}
