//
//  AddQuestionViewController.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/7/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit


class AddQuestionViewController: UIViewController {

    @IBOutlet weak var userQuestion: UITextField!
    
    let backendless = Backendless.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func addQuestion(sender: UIButton) {
        
        let newQuestion = Question()
        let currentUser = backendless.userService.currentUser
        
       newQuestion.question = userQuestion.text
        newQuestion.userName = currentUser.name
        
        
        let dataStore = backendless.data.of(Question.ofClass())
        
        // save object synchronously
        var error: Fault?
        let result = dataStore.save(newQuestion, fault: &error) as? Question
        if error == nil {
            
            print("Question has been saved: \(result!.question)")
            
        }
        else {
            print("Server reported an error: \(error)")
        }
}
}


/*
        func saveNewContact() {
            
            let newQuestion = Question()
           
            
            let dataStore = backendless.data.of(Question.ofClass())
            
            // save object synchronously
            var error: Fault?
            let result = dataStore.save(newQuestion, fault: &error) as? Question
            if error == nil {
                print("Contact has been saved: \(result!.objectId)")
            }
            else {
                print("Server reported an error: \(error)")
            }
            
            // save object asynchronously
            dataStore.save(
                contact,
                response: { (result: AnyObject!) -> Void in
                    let obj = result as! Contact
                    print("Contact has been saved: \(obj.objectId)")
                },
                error: { (fault: Fault!) -> Void in
                    print("fServer reported an error: \(fault)")
            })
        }


        
        
    }
*/


