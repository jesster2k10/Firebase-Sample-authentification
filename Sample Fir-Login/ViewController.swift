//
//  ViewController.swift
//  Sample Fir-Login
//
//  Created by Jesse on 28/11/2016.
//  Copyright © 2016 Flatbox Apps. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    var isLogin:Bool! = false
    
    @IBOutlet weak var wereGoingToLogin: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loginSignUp () {
        
        //0
        if isLogin == false {
            //1
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                //2
                if error == nil {
                    print("Successfull created user with email" + user!.email!)
                }
                    
                    //3
                else {
                    print("An error occoured" + (error?.localizedDescription)!)
                }
            })
        } 
           
        //4
        else if isLogin == true {
            //5
            FIRAuth.auth()?.signIn(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                //6
                if error == nil {
                    print("Successfull loggedin user with email" + user!.email!)
                }
                    
                //7
                else {
                    print("An error occoured" + (error?.localizedDescription)!)
                }
            })
        }
        
    }
    
    //8
    @IBAction func continueAc(_ sender: Any) {
        loginSignUp()
    }
    
    @IBAction func login(_ sender: Any) {
        isLogin = true
        wereGoingToLogin.text = "We're going to be logging in"
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        isLogin = false
        wereGoingToLogin.text = "We're going to be signing up"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

