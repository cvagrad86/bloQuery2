//
//  UserProfileViewController.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/8/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import Foundation

class UserProfileViewController: UIViewController {

    
    @IBOutlet weak var userNameLabel: UILabel!
    var backendless = Backendless.sharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = backendless.userService.currentUser.name
       

    }
    @IBAction func changeProfilePicture(sender: AnyObject) {
    }
    
    
}
