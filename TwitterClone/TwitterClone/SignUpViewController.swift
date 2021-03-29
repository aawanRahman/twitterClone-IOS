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

class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signUp: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func didTapCancel(_ sender: Any) {
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        
    }
    
}
