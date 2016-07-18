//
//  InstrumentationViewController.swift
//  Assignment4
//
//  Created by Dan November on 7/17/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {
    var myGrid = Grid()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var rowsTextField: UITextField!
    @IBAction func rowStepper(sender: UIStepper) {
        rowsTextField.text = String(sender.value)
    }
    
    @IBOutlet weak var colsTextField: UITextField!
    @IBAction func colsStepper(sender: UIStepper) {
        colsTextField.text = String(sender.value)
    }
    
    @IBAction func refreshSlider(sender: UISlider) {
        print(sender.value)
    }
}

