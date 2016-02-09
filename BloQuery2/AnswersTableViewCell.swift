//
//  AnswersTableViewCell.swift
//  BloQuery2
//
//  Created by Eric Chamberlin on 2/8/16.
//  Copyright © 2016 Eric Chamberlin. All rights reserved.
//

import UIKit
import Foundation

class AnswersTableViewCell: UITableViewCell {

    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var upVotesButton: UIButton!
    @IBOutlet weak var downVotesButton: UIButton!
    
    
    
    var voteAdded = 0
    //var parseObject : PFObject?
    //var currentAnswer : PFObject?
    var objectID: String!
    
    
    override func awakeFromNib() {
        //if let object = currentAnswer {
        //answersLabel.text = (object["Answer"] as! String)
        // donesnt work - answersLabel.text = object.objectForKey("answer") as? String
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    
    @IBAction func downBoteButton(sender: AnyObject) {
        voteAdded--
        print("vote retracted")
        
        downVotesButton = sender as! UIButton
        
        downVotesButton.alpha = 0.0
        
    }
    @IBAction func upvoteButton(sender: AnyObject) {
        voteAdded++
        print("vote added")
        
        upVotesButton = sender as! UIButton
        
        upVotesButton.alpha = 0.0
        
    }
    
    
}

