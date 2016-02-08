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

    @IBOutlet weak var newEmail: UITextField?
    @IBAction func saveChanges(sender: AnyObject) {
        
        // - shut off the fault as exception
        backendless.setThrowException(false)
        
        //var result : AnyObject
        var fault : Fault?
        
        // - sync method with fault as reference (fault as exception should be shutted off !)
        let item : AnyObject? = backendless.persistenceService.save(User (), error: &fault)
        if (fault == nil) {
            let obj : AnyObject = backendless.persistenceService.save(User)
            if (obj is User) {
                //print("OrderItem: \((obj as! User).itemName) <\((obj as! User).objectId)>")
                newUserName.text = obj.name as String
                //newEmail.text = User.email as String
            }
            else {
                print("\nFAULT (0): \(fault!.description)")
            }
        }
        else {
            print("\nFAULT (0): \(fault!.description)")
        }
    }
    
   
    @IBAction func resetPassword(sender: AnyObject) {
        
        backendless.userService.restorePassword("password")
        
        
        
        
    }
    
}
