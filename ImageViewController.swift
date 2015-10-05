//
//  ImageViewController.swift
//  quiz1
//
//  Created by Dylan Fiedler on 9/30/15.
//  Copyright © 2015 GE. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textBox: UITextField!
    
    
    @IBOutlet weak var quitButton: UIBarButtonItem!
    @IBOutlet weak var scoreButton: UIBarButtonItem!
    
    var count: Int!
    var score: Int!
    
    var names: [NSString!] = ["indiana", "iowa", "maryland", "michigan", "minnesota", "michigan state",  "nebraska", "rutgers", "northwestern", "penn state", "purdue", "rutgers", "illinois", "wisconsin"]
    
    
    var images: [UIImage!] =
        [UIImage(named: "iu.jpg"),
        UIImage(named: "iowa.jpg"),
        UIImage(named: "maryland.jpg"),
        UIImage(named: "michigan.png"),
        UIImage(named: "minnesota.png"),
        UIImage(named: "msu.png"),
        UIImage(named: "nebraska.png"),
        UIImage(named: "northwestern.gif"),
        UIImage(named: "pstate.png"),
        UIImage(named: "purdue.png"),
        UIImage(named: "rutgers.png"),
        UIImage(named: "illinois.jpg"),
        UIImage(named: "wisconsin.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textBox.delegate = self
        
        if (count == nil){
            count = 0
        }
        self.navigationController?.setToolbarHidden(false, animated: true)
        imageView.image = images[count]

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setToolbarHidden(false, animated: true)
        if (count == names.count){
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
        submit(self)
        return true;
    }

    
    @IBAction func submit(sender: AnyObject) {
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
        
        
        if (guess.isEqualToString(names[count] as String)){
            score = score + 1
            print("correct")
            
        }
        
        self.textBox.text = ""
        
        if (count < images.count - 1 ){
            count = count + 1
            imageView.image = images[count]
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
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "main"){
            print(score)
            let home = segue.destinationViewController as! HomeController
            home.score = score
            home.textCount = count
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
