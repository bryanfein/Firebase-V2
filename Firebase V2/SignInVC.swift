//
//  ViewController.swift
//  Firebase V2
//
//  Created by Bryan Fein on 5/9/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class SignInVC: UIViewController {
    
    //variables
    
    //    let databaseRef = FIRDatabase.database().reference(fromURL:"https://fir-template-8ec60.firebaseio.com/") //ref to database
//    var databaseRef : FIRDatabaseReference!
    
    
    //outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var usernameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        databaseRef = FIRDatabase.database().reference()
        
    }
    
    
    //Actions
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        logIn()
    }
    
    @IBAction func SignUpButton(_ sender: UIButton) {
        
//        signUp ()
    }
    
    
    //Functions
    
//    func signUp () {
//        
//        guard let username = usernameField.text else {
//            print("uername Error")
//            return
//        }
//        
//        guard let email = emailField.text else {
//            print("Password Error")
//            return
//        }
//        
//        
//        guard let password = passwordField.text else {
//            print("Password Error")
//            return
//        }
//        
//        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user,error) in
//            
//            if error != nil {
//                print("Error")
//                return
//            }
//            
//            let userID: String = user!.uid
//            let userEmail: String = email
//            let userPassword: String = password
//            
//            self.databaseRef.child("Users").child(userID).setValue(["Email": userEmail, "Password": userPassword])
//            
//            
//            
//        })
//        
//        
//        
//        //            guard let uid = user?.uid else {
//        //                return
//        //            }
//        //            let userRefence = self.databaseRef.child("users").child(uid)
//        //            let values = ["username" : username, "email" : email]
//        //
//        //
//        //            userRefence.updateChildValues(values, withCompletionBlock: {(error, ref) in
//        //                if error != nil {
//        //                    print(error!)
//        //                    return
//        //                }
//        //
//        //                self.dismiss(animated: true, completion: nil)
//        //            })
//        //
//        //        })
//        
//    }
//    
    
    
    func logIn() {
        guard let email = emailField.text else {
            print("Email Error")
            return
        }
        
        guard let password = passwordField.text else {
            print("Password Error")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //            guard let signInVC = storyboard.instantiateViewController(withIdentifier:"LoggedInVC") as? LoggedInVC else {
            //                return
            //            }
            
            //            self.present(signInVC, animated: true, completion: nil)
            // we've logged in
            
            //        })
            
            self.dismiss(animated: false, completion: nil)
        })
    }
    
}
