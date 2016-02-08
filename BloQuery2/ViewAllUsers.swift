//
//  ViewAllUsers.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/8/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import Foundation


class ViewAllUsers: UITableViewController {


    var backendless = Backendless.sharedInstance()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell",
            forIndexPath: indexPath) as! UsersTableViewCell
    
        
        
        return cell
    }
    
    
    
    
    
    
    func testPersistenceService() {
        
        // - sync methods with fault as exception (short "try/catch" version)
        Types.tryblock({ () -> Void in
            
            let obj = User()
            let result : AnyObject? = self.backendless.persistenceService.save(obj)
            NSLog("User: %@", (result as! User).description)
            
            },
            
            catchblock: { (exception) -> Void in
                NSLog("FAULT: %@", exception as! Fault)
            }
        )
        
        
        // - shut off the fault as exception
        backendless.setThrowException(false)
        
        var result : AnyObject
        var fault : Fault?
        
        // - sync method with fault as reference (fault as exception should be shutted off !)
        let item : AnyObject? = backendless.persistenceService.save(User(), error: &fault)
        if (fault == nil) {
            let obj : AnyObject = backendless.persistenceService.findById("User", sid: (item as! User).objectId)
            if (obj is User) {
                print("User: \((obj as! User).name) <\((obj as! User).objectId)>")
            }
            else {
                print("\nFAULT (0): \(fault!.description)")
            }
        }
        else {
            print("\nFAULT (0): \(fault!.description)")
}

        var query1 : QueryOptions = QueryOptions()
        query1.sortBy = ["name", "objectId"]
        var dataQuery1 : BackendlessDataQuery = BackendlessDataQuery()
        dataQuery1.queryOptions = query1

        result = backendless.persistenceService.find(User().ofClass(), dataQuery:dataQuery1)
        if (result is BackendlessCollection) {
            var bc1 : BackendlessCollection = result as! BackendlessCollection
            for order : User in bc1.data as! [User  ] {
                
                let cell = UsersTableViewCell()
                
                cell.userEmailLabel.text = order.email
                cell.userNameLabel.text = order.name
            
            }
        }
        if (result is Fault) {
            print("\nFAULT (0): \(fault!.description)")
        }

}
}
