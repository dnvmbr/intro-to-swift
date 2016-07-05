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
    
    @IBOutlet weak var problemTwoTextViewAfter: UITextView!
    @IBOutlet weak var problemTwoTextView: UITextView!

    @IBAction func step(sender: UIButton) {
        for row in self.grid.cells {
            for cell in row {
                if cell.isAlive {
                    let beforeneighbors = self.grid.neighbors(cell)
                    let beforeNeighborsAlive = beforeneighbors!.count
                    self.problemTwoTextView.text = ("Before has \(beforeNeighborsAlive) alive neighbor(s)")
                }
            }
        }
        
        // Make copy of grid
        var after = grid
        // Go through the grid copy
        for row in after.cells {
            for cell in row {
                // If the cell is alive then check its neighbors
                if cell.isAlive {
                    // Get cell's neighbors
                    let neighbors = after.neighbors(cell)
                    if neighbors!.count < 2 {
                        // Cell dies from starvation
                        cell.status = .underpopulation
                    }
                    else if neighbors!.count > 3 {
                            cell.status = .overcrowding
                    }
                    else if cell.isAlive == false && neighbors!.count == 3 {
                        cell.status = .reproduced
                    }
                }
            }
        }
        for row in after.cells {
            for cell in row {
                if cell.isAlive {
                    let afterneighbors = after.neighbors(cell)
                    let afterNeighborsAlive = afterneighbors!.count
//                    self.problemTwoTextViewAfter.text = ("After has \(afterNeighborsAlive) alive neighbor(s)")
                }
            }
        }

        
//        self.problemTwoTextView2.text =  after.string()
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
        self.problemTwoTextView.text = self.grid.string()
        
        // Get cell alive count
        print(self.grid.aliveCount())
    }
}
