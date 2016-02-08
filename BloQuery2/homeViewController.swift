//
//  homeViewController.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/4/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    var backendless = Backendless.sharedInstance()
    
    override func viewWillAppear(animated: Bool) {
        if (backendless.userService.currentUser == nil) {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login") as! UIViewController
                self.presentViewController(viewController, animated: true, completion: nil)
                
        })
        }
    }
    
}
