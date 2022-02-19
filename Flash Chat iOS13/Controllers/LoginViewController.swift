//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase // firebase


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        
        // login authentication on firebase
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            
            Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
                
                if let e = error {
                    
                    
                    // create the alert
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    
                    // add the actions (buttons)
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                    // print error
                    // print(e.localizedDescription) // "localizedDescription" using for print error in divice on app running (Retrieve the localized description for this error.)
                    
                    
                }else{
                    self.performSegue(withIdentifier: K.loginSegue, sender: self) // to navigate "ChatViewController"
                }
            }
        }
        
        
    }
    
}
