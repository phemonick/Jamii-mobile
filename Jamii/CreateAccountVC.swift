//
//  CreateAccountVC.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 27/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import UIKit

class CreateAccountVC : UIViewController{
    
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var fullNameTF: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.text = "123456"
        emailTF.text = "emailse"
        fullNameTF.text = "joyce"
        
    }
    
    
    @IBAction func didTouchCreateAccount(_ sender : Any){
        
        if emailTF.getText().count > 5 && passwordTF.getText().count > 3 && fullNameTF.getText().count > 3 {
            let alert = Utilities().showLoader(vc : self)
            Networker.shared.post(url: URLConstants.signup, params: ["email" : emailTF.getText(), "password" : passwordTF.getText(), "fullName" : fullNameTF.getText()]) { [weak self](result : Result<User, APIError>) in
                
                switch result{
                case .success(let user):
                    UserDefaults.standard.saveUser(user: user)
                    UserDefaults.standard.setLoggedIn(value: true)
                    DispatchQueue.main.async {
                        self?.performSegue(withIdentifier: "ToHome", sender: nil)
                    }
                case .failure(.badURL), .failure(.requestFailed), .failure(.jsonConversionFailure), .failure(.invalidData), .failure(.responseUnsuccessful):
                    DispatchQueue.main.async {
                        Utilities().hideLoader(alert : alert)
                    }
                    self?.showAlert(withTitle: "Error", withMessage: "The request couldnt be processed")
                }
            }
        }else{
            showAlert(withTitle: "Error", withMessage: "Email or Password or Full name Invalid")
        }
        
    }
    
    
    @IBAction func didTouchSkipRegistration(_ sender : Any){
        
        performSegue(withIdentifier: "ToHome", sender: nil)

    }
}

