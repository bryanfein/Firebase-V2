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
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if FIRAuth.auth()?.currentUser?.uid == nil {
            logout()
//            print("YO MAMA IS NAMED :\(FIRAuth.auth()?.currentUser?.uid)")
        }
    }
    
    
    func logout() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let signInVC = storyboard.instantiateViewController(withIdentifier:"SignInVC") as? SignInVC else {
            return
        }
        present(signInVC, animated: true, completion: nil)
    }
    

    @IBAction func logoutButton(_ sender: UIButton) {
        
        logout()
        
    }

}
