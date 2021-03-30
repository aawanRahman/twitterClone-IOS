//
//  SignUpViewController.swift
//  TwitterClone
//
//  Created by aawan on 29/3/21.
//  Copyright © 2021 aawan. All rights reserved.
//

import UIKit
import FirebaseDatabase

import  FirebaseAuth


class FirebaseAuthManager {
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
    }
}

class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signUp: UIBarButtonItem!
   // var ref: DatabaseReference!
    @IBOutlet weak var errorMessage: UILabel!
    
    var ref = Database.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUp.isEnabled = false

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in
            
            alert.dismiss(animated: true, completion: nil)
            
            
        }))
        self.present(alert, animated: true, completion: nil)
        
     
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        signUp.isEnabled = false
        
        let signUpManager = FirebaseAuthManager()
        if let email = email.text, let password = password.text {
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully created."
                } else {
                    message = "There was an error."
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.createAlert(title: "Sign Up!!", message: "User is successfully created")
                //display(alertController: alertController)
            }
        }
        
        
    }
    
    @IBAction func didTextChanged(_ sender: UITextField) {
        if(!email.text!.isEmpty == true && !password.text!.isEmpty==true) {
            signUp.isEnabled = true
            
        }
        else {
            signUp.isEnabled = false
        }
    }
}
