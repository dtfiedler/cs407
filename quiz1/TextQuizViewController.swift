//
//  TextQuizViewController.swift
//  quiz1
//
//  Created by Dylan Fiedler on 9/30/15.
//  Copyright © 2015 GE. All rights reserved.
//

import UIKit

class TextQuizViewController: UIViewController, UITextFieldDelegate {
    
    var score: Int!
    var count: Int!
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var textBox: UITextField!
    
    var questions: [NSString!] = [" Which movie would you hear the song 'Hakuna Matata'?", "In which television show would you find characters named Fred, Doris, and Arnold?", "Which type of scientist studies and forecasts the weather?", "What color would you get if you mixed red and yellow together?", "What is the name of the dog in Garfield?", "Who played Derek Zoolander and Gaylord 'Greg' Focker?", "Who wrote the Harry Potter books?", "Your father's brother is what relation to you?", "If you re-arrange the letters NAPIS, what country could you spell?", "In what sport is a ball with 'dimples' on the outside used?"]
    
    var answers = ["Lion King", "Green Acres", "Meteorologists", "Green", "Odie", "Ben Stiller", "J.K. Rowling", "Uncle", "Spain", "Golf"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textBox.delegate = self
        
        if (count == nil){
                count = 0
        }
        question.text = questions[count] as String

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        if (count == questions.count){
            let alertView = UIAlertView()
            alertView.title = "You have completed this quiz!"
            alertView.addButtonWithTitle("Home")
            alertView.show()
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        submitButton(self)
        return true;
    }

    
    @IBAction func submitButton(sender: AnyObject) {
        var guess: NSString! = textBox.text as NSString!
        print(guess)
        guess = guess.lowercaseString
        if (guess.length == 0){
            let alertView = UIAlertView()
            alertView.title = "You didn't guess anything!"
            alertView.addButtonWithTitle("Try again")
            alertView.show()
            return
        }
        
        
        if (guess.isEqualToString(answers[count].lowercaseString)){
            score = score + 1 
            print("correct")
            
        }
        
        self.textBox.text = ""
        
        if (count < questions.count - 1 ){
            count = count + 1
            question.text = questions[count] as String!
        } else {
            let alertView = UIAlertView()
            alertView.title = "You have completed this quiz!"
            alertView.addButtonWithTitle("Home")
            alertView.show()
            let segue = UIStoryboardSegue(identifier: "main", source: self, destination: HomeController())
            self.prepareForSegue(segue, sender: self)
            self.performSegueWithIdentifier("main", sender: self)
        }

        
        
    }
    
    @IBAction func showScore (sender:AnyObject){
        let total = score
        let alertView = UIAlertView()
        alertView.title = "You have gotten \(total) correct"
        alertView.addButtonWithTitle("Keep playing")
        alertView.show()
        return
    }
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "main"){
            let home = segue.destinationViewController as! HomeController
            home.score = score
            home.textCount = count
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
