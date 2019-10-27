//
//  LoginVC.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 26/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit


class LoginVC : UIViewController{
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func didTouchLogin(_ sender: Any) {
        
        if emailTF.getText().count > 5 && passwordTF.getText().count > 3 {
//            showLoader()
            Networker.shared.post(url: URLConstants.login, params: ["email" : emailTF.getText(), "password" : passwordTF.getText()]) { [weak self](result : Result<User, APIError>) in
//                self?.hideLoader()
                switch result{
                case .success(let user):
                    print(user)
                case .failure(.badURL), .failure(.requestFailed), .failure(.jsonConversionFailure), .failure(.invalidData), .failure(.responseUnsuccessful):
                 self?.showAlert(withTitle: "Error", withMessage: "The request couldnt be processed")
                }
            }
        }else{
            showAlert(withTitle: "Error", withMessage: "Email or Password Invalid")
        }
        
        
    }
    
    @IBAction func didTouchSkip(_ sender: Any) {
        
        
    }
    
    @IBAction func didTouchCreateAccount(_ sender: Any) {
    }
}


class Model : Decodable{
    
}
