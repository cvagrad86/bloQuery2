//
//  LoginViewController.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/4/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var userNameLogin: UITextField!
    @IBOutlet weak var userPasswordLogin: UITextField!
    
    var backendless = Backendless.sharedInstance()
    
    func setStayLoggedIn(value: Bool) -> Bool
    {
        //let backendless = Backendless.sharedInstance()
        backendless.userService.setStayLoggedIn( true )
        
        return true
    }
    
    @IBAction func userLogin(sender: AnyObject) {
        
        // - sync methods with fault as exception (full "try/catch/finally" version)
        Types.tryblock({ () -> Void in
            
            // - user login
            let user = self.backendless.userService.login(self.userNameLogin.text, password: self.userPasswordLogin.text)
            NSLog("LOGINED USER: %@", user.description)
            
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
            /*
            // - user update
            var counter: AnyObject! = user.getProperty("counter")
            user.setProperty("counter", object: counter)
            user = self.backendless.userService.update(user)
            NSLog("UPDATED USER: %@", user.description)
            */
            
            },
            
            catchblock: { (exception) -> Void in
                NSLog("FAULT: %@", exception as! Fault)
            },
            
            finally: { () -> Void in
                NSLog("USER OPERATIONS ARE FINISHED")
                
               
        })

            }
    

    }
    
    
