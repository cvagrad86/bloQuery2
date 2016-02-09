//
//  QuestionsAndAnswersTableViewController.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/8/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import Foundation

class QuestionsAndAnswersTableViewController: UITableViewController {

    let backendless = Backendless.sharedInstance()
    
    @IBOutlet weak var currentQuestionLabel: UILabel!
    var currentObject:Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
            //currentQuestionLabel.text = (currentObject!.question! as String)
      
        //print("\(currentObject)")
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        // return allQuestions.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("answerCell",
            forIndexPath: indexPath) as! AnswersTableViewCell
        
        
        

        
        
        return cell
        
    }
    
    
    
    @IBAction func addAnswer(sender: AnyObject) {
        
        //click to add an answer
        
    }
}
