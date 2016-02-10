//
//  ViewAllUsers.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/8/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import Foundation


class ViewAllUsers: UITableViewController  {


    @IBOutlet var allUsersTableView: UITableView!
    
    var backendless = Backendless.sharedInstance()
    var listOfUsers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchingUsersSync()
        
    }
    
    


func fetchingUsersSync() {
    
    Types.tryblock({ () -> Void in
        
        let dataStore = self.backendless.persistenceService.of(BackendlessUser.ofClass())
        let users = dataStore.find()
        
        print("Users have been fetched (SYNC): \(users)")
        
        
        },
        
        catchblock: { (exception) -> Void in
            print("Server reported an error (SYNC): \(exception as! Fault)")
        }
    )
}



    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell",
            forIndexPath: indexPath) as! UsersTableViewCell
        
    //cell.userNameLabel.text = fetchingUsersSync()
           return cell
    
    
    
    }
}
