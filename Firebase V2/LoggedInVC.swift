//
//  LoggedInVC.swift
//  Firebase V2
//
//  Created by Bryan Fein on 5/10/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoggedInVC: UIViewController {
    
    //variables
    
    let stroage = FIRStorage.storage().reference()
    let database = FIRDatabase.database().reference()
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if FIRAuth.auth()?.currentUser?.uid == nil {
            logout()
        }
        
//        setupProfile()
    }
    
    //functions
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupProfile()

        
    }
    
    
    func setupProfile(){
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            
            
            logout()
            
        } else {
            
            let uid = FIRAuth.auth()?.currentUser?.uid
            database.child("Users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dict = snapshot.value as? [String: AnyObject]
                {
                    self.usernameLabel.text = dict["Username"] as? String
//                    self.usernameLabel.text = FIRAuth.auth()?.currentUser?.uid

                    
                }
            })
            
        }
    }
    
    func logout() {
        
        try! FIRAuth.auth()?.signOut()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let signInVC = storyboard.instantiateViewController(withIdentifier:"SignInVC") as? SignInVC else {
            return
        }
        present(signInVC, animated: false, completion: nil)
    }
    
    
    func saveChanges () {
        
        
    }
    
    // actions
    @IBAction func logoutButton(_ sender: UIButton) {
        
        logout()
        
    }
    
}


