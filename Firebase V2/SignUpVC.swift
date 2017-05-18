//
//  SignUpVC.swift
//  Firebase V2
//
//  Created by Bryan Fein on 5/11/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class SignUpVC: UIViewController {
    
    
    //variables
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var databaseRef : FIRDatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseRef = FIRDatabase.database().reference()
        
    }
    
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        signUp()
        
    }
    
    //functions
    
    func signUp () {
        
        guard let username = username.text else {
            print("uername Error")
            return
        }
        
        guard let email = emailField.text else {
            print("Password Error")
            return
        }
        
        
        guard let password = passwordField.text else {
            print("Password Error")
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user,error) in
            
            if error != nil {
                print("Error")
                return
            }
            
            let username: String = username
            let userID: String = user!.uid
            let userEmail: String = email
            let userPassword: String = password
            
            self.databaseRef.child("Users").child(userID).setValue(["Username": username, "Email": userEmail, "Password": userPassword])
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let signInVC = storyboard.instantiateViewController(withIdentifier:"LoggedInVC") as? LoggedInVC else {
                return
            }
            self.present(signInVC, animated: true, completion: nil)
            
        })
   
    }
  
}




//            guard let uid = user?.uid else {
//                return
//            }
//            let userRefence = self.databaseRef.child("users").child(uid)
//            let values = ["username" : username, "email" : email]
//
//
//            userRefence.updateChildValues(values, withCompletionBlock: {(error, ref) in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//
//                self.dismiss(animated: true, completion: nil)
//            })
//
//        })
