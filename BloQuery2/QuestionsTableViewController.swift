//
//  QuestionsTableViewController.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/4/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit


class QuestionsTableViewController: UITableViewController {

    
    let backendless = Backendless.sharedInstance()
    //let allQuestions = [BackendlessDataQuery]()
    var currentQuestion = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetchingFirstPageAsync()
    }
    /*
    func fetchingFirstPageAsync() {
        
        let startTime = NSDate()
        
        backendless.persistenceService.of(Question.ofClass()).find(
            BackendlessDataQuery(),
            response: { (let questions  : BackendlessCollection!) -> () in
                let currentPage = questions.getCurrentPage()
                print("Loaded \(currentPage.count) questions")
                
                
                for question in currentPage {
                    let rest : Question = question as! Question
                    
                }
                
                print("Total time (ms) - \(1000*NSDate().timeIntervalSinceDate(startTime))")
            },
            error: { (let fault : Fault!) -> () in
                print("Server reported an error: \(fault)")
        })
    }
*/
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
       // return allQuestions.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("questionCell",
            forIndexPath: indexPath) as! QuestionsTableViewCell
        
        
        Types.tryblock({ () -> Void in
            
            let startTime = NSDate()
            
            let query = BackendlessDataQuery()
            
            var allQuestions = self.backendless.persistenceService.of(Question.ofClass()).find(query)
            print("Total restaurants in the Backendless starage - \(allQuestions.totalObjects)")
            
            let bc1 : BackendlessCollection = allQuestions as BackendlessCollection
            for order : Question in bc1.data as! [Question] {
                
                cell.questionLabel.text = order.question
                cell.userNameLabel.text = order.userName
                
            }
            var size = allQuestions.getCurrentPage().count
            while size > 0 {
                print("Loaded \(size) restaurant in the current page")
                allQuestions = allQuestions.nextPage()
                size = allQuestions.getCurrentPage().count
                
                
                
            }
            
            print("Total time (ms) - \(1000*NSDate().timeIntervalSinceDate(startTime))")
            },
            
            catchblock: { (exception) -> Void in
                print("Server reported an error: \(exception as! Fault)")
            }
        )
        /* works, but still only brings the first question created
        let startTime = NSDate()
        
        backendless.persistenceService.of(Question.ofClass()).find(
            BackendlessDataQuery(),
            response: { (let questions  : BackendlessCollection!) -> () in
                let currentPage = questions.getCurrentPage()
                
                print("Loaded \(currentPage.count) questions")
                
                for question in currentPage {
                    let rest : Question = question as! Question
                    cell.userNameLabel.text = rest.userName
                    cell.questionLabel.text = rest.question
                }
                
                print("Total time (ms) - \(1000*NSDate().timeIntervalSinceDate(startTime))")
            },
            error: { (let fault : Fault!) -> () in
                print("Server reported an error: \(fault)")
        })
        */

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showQuestions", sender: self)
    }
    
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showQuestions" {
            if let destination = segue.destinationViewController as? QuestionsAndAnswersTableViewController {
                if blogIndex = tableView.indexPathForSelectedRow!.row {
                    destination.currentObject = Question[blogIndex]
                }
        
        if segue.identifier == "showQuestions" {
            
            let nav = segue.destinationViewController as! UINavigationController
            
            //segue.destinationViewController.isKindOfClass(UINavigationController)
            
            let controller = nav.topViewController as! QuestionsAndAnswersTableViewController
            let indexPath = tableView.indexPathForSelectedRow
            
            controller.currentObject = currentQuestion[(indexPath?.row)!]

        }
        
    }


        }

*/


    /*
    func saveNewPost () {
        var result : AnyObject = backendless.persistenceService.save(Question())
        if (result is Question) {
            var obj : AnyObject = backendless.persistenceService.findById("Question", sid:(result as! Question).objectId)
        }
        if (result is Fault) {
            var fault : Fault = result as! Fault
            NSLog("FAULT")
        }
    }

        
    
        
        func reloadTable() {
            print("success")
        }
        
        


        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
            let nav = segue.destinationViewController as! UINavigationController
            let controller = nav.topViewController as! QuestionsAndAnswersTableViewController
            
            if segue.identifier == "showQuestions" {
                
                let indexPath = tableView.indexPathForSelectedRow
                
                controller.currentObject = self.objects![indexPath!.row]
                //resulted in carsh = nil value
                //controller.connectedAnswers = self.objects![indexPath!.row]
            }

        }
        */
    
    /* old query from within the tableview
    
    let query1 : QueryOptions = QueryOptions()
    //query1.sortBy = ["question"]
    let dataQuery1 : BackendlessDataQuery = BackendlessDataQuery()
    dataQuery1.queryOptions = query1
    
    let result = backendless.persistenceService.find(Question().ofClass(), dataQuery:dataQuery1)
    if (result is BackendlessCollection) {
    let bc1 : BackendlessCollection = result as BackendlessCollection
    for order : Question in bc1.data as! [Question] {
    
    cell.questionLabel.text = order.question
    cell.userNameLabel.text = order.userName
    
    }
    
    }
    if (result is Fault) {
    print("something went wrong")
    }
    */
    
    

    
   
    
    

    
}
