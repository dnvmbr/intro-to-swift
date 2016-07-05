//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Dan November on 7/1/16.
//  Copyright © 2016 Dan November. All rights reserved.
//
import UIKit

class Problem2ViewController: UIViewController {

    var grid: Grid!
    
    @IBOutlet weak var problemTwoTextView: UITextView!

    @IBAction func step(sender: UIButton) {
        
        // Simulate life here
        
        for row in self.grid.cells {
            
            for cell in row {
                
                // If the cell is alive then check its neighbors
                if cell.isAlive {
                
                    let neighbors = self.grid.neighbors(cell)
                    let neighborsAlive = neighbors!.count
                    
                    if neighbors!.count > 0 {
                     
                        print(neighbors!)
                        print(neighborsAlive)
                        
                        // test
                        for cell in neighbors! {
                            
                            print(cell.location)
                        }
                    }
                }
                
                break
            }
            
            break
        }
    }
    
    @IBAction func run(sender: UIButton) {
        
        // Simuate continuous life here
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Problem 2"
        
        // Create grid
        self.grid = Grid(width: 10, height: 10)
        
        // Prints the grid on the text view
        self.problemTwoTextView.text =  grid.string()
        
        // Get cell alive count
        print(self.grid.aliveCount())
    }
}
