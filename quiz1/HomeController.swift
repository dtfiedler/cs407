//
//  ViewController.swift
//  quiz1
//
//  Created by Dylan Fiedler on 9/30/15.
//  Copyright © 2015 GE. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    var score: Int!
    var quizCount: Int!
    var textCount: Int!

    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (score == nil){
                score = 0
                scoreLabel.hidden = true
        } else {
                scoreLabel.hidden = false
                scoreLabel.text = "Total Score: \(score)"
        }
        
        if (quizCount == nil){
                quizCount = 0
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        if (score == nil){
            score = 0
            scoreLabel.hidden = true
        } else {
            scoreLabel.hidden = false
            scoreLabel.text = "Total Score: \(score)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "image"){
                let quiz = segue.destinationViewController as! ImageViewController
                quiz.score = score
                quiz.count = quizCount
        } else {
            let text = segue.destinationViewController as! TextQuizViewController
            text.score = score
            text.count = textCount
        }
    }

    

}

