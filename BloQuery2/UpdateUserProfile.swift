//
//  UpdateUserProfile.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/8/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import Foundation


class UpdateUserProfile: UIViewController {
    
    let backendless = Backendless.sharedInstance()
    
    @IBOutlet weak var newUserName: UITextField!

    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    
    //func update(_ user: BackendlessUser! ) -> BackendlessUser!
    
    @IBAction func saveChanges(sender: AnyObject) {
        
            Types.tryblock({ () -> Void in
                
                let user = BackendlessUser()
               
                
                let registeredUser = self.backendless.userService.currentUser
                //print("User has been registered (SYNC): \(registeredUser)")
                
                let properties = [
                   "name" : self.passWord.text! as String,
                   "email" : self.newUserName.text! as String,
                   "password" : self.newEmail.text! as String
                ]
                
                registeredUser.updateProperties( properties )
                let updatedUser = self.backendless.userService.update(user)
                print("User updated (SYNC): \(updatedUser)")
                
                },
                
                catchblock: { (exception) -> Void in
                    print("Server reported an error: \(exception)" )
            })
        
            }
    
   
    @IBAction func resetPassword(sender: AnyObject) {
        
        backendless.userService.restorePassword("password")
        
    }
    
}
