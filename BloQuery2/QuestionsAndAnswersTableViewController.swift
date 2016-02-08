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

    @IBOutlet weak var currentQuestionLabel: UILabel!
    var currentObject = [Question].self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //currentQuestionLabel.text = currentObject.
        
        print("\(currentObject)")
        
    }
    @IBAction func addAnswer(sender: AnyObject) {
        
        //click to add an answer
        
    }
}
