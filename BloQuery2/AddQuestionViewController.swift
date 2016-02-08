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
        
        backendless.setThrowException(false)
        
        var result : AnyObject?
        var fault : Fault?
        
        result = backendless.persistenceService.save(Question())
        if (result is Question) {
            let obj : AnyObject = backendless.persistenceService.findByObject(Question)
            if (obj is Question) {
                let obj1 = obj as! Question
                print("\nQuestion (1): \(obj1.description)")
                userQuestion.text = obj1.question
                
            }
        }
        if (result is Fault) {
            print("Something went wrong")
        }

        
        
    }

}

