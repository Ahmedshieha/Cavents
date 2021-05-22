//
//  SignUpViewController.swift
//  Cavents
//
//  Created by Reda on 07/01/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFiele: UITextField!
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
        SignUp {
            print("ok")
        }
    }
    
    func SignUp(_ combletionHandler : @escaping () ->() ) {
        
        FirebaseAuth.Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextFiele.text!) { (result , error) in
            guard error == nil else {
                self.alert(title: "Error", message: error!.localizedDescription)
                return
            }
            combletionHandler()
            print("success create user")
            
        }
    }
    
    
    
}
