//
//  registerViewController.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/4/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit


class registerViewController: UIViewController {

    var backendless = Backendless.sharedInstance()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func newUser(sender: AnyObject) {
        
        let email = self.emailTextField.text
        let password = self.passWordTextField.text
        let name = self.fullNameTextField.text
        let user = BackendlessUser()
        
        user.password = password
        user.setProperty("email", object: email)
        user.setProperty("name", object: name)
        
        
        Backendless.sharedInstance().userService.registering(user, response: { (user) -> Void in
            
            print(user)
            
            }) { (fault) -> Void in
                
                print(fault.message, fault.detail)
                
        }
        
    }

    }

        
    

