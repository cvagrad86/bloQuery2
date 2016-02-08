//
//  ViewController.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/2/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let backendless = Backendless.sharedInstance()
        let user: BackendlessUser = BackendlessUser()
        user.email = "echamberlin@me.com"
        user.password = "my_super_password"
        backendless.userService.registering(user)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

