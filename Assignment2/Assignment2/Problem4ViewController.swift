//
//  Problem4ViewController.swift
//  Assignment2
//
//  Created by Dan November on 7/1/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import UIKit

class Problem4ViewController: UIViewController {

    @IBOutlet var problemFourTextView: UITextView!
    @IBAction func problemFourButton(sender: UIButton) {
        step2()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 4"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
