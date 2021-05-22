//
//  ViewController.swift
//  Cavents
//
//  Created by Reda on 10/29/20.
//  Copyright © 2020 Reda. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
//import FirebaseFirestoreSwift


class ViewController: UIViewController {
    let db = Firestore.firestore()
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        login {
            //        self.goToTableView()
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        signUp()
    }
    
    func login (_ combletionHandler :@escaping ()-> () ) {
        FirebaseAuth.Auth.auth().signIn(withEmail:   emailTextField.text!, password: passwordTextField.text!){ (result , error) in
            guard  error == nil else {
                self.alert(title: "Error", message: error!.localizedDescription)
                return
            }
            combletionHandler()
            print("success")
            
        }
    }
    
    func signUp() {
        let signUpViewController = UIStoryboard(name: "Main", bundle: nil)
        let SignUpViewController = signUpViewController.instantiateViewController(withIdentifier: "SignUpViewController")
        self.present(SignUpViewController, animated: true, completion: nil)
    }
    
    
}

extension UIViewController {
    func alert (title : String , message : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        present(alert,animated: true)
    }
    
    
}


