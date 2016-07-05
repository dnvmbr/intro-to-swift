//
//  Grid.swift
//  Assignment2
//
//  Created by Dan November on 7/4/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import UIKit

class Grid: NSObject {

    let width: Int
    let height: Int
    
    var cells = [[Cell]]()
    
    // This function sets up the grid
    required init(width: Int, height: Int) {
        
        self.width = width
        self.height = height
        
        var tempArray = Array(count: self.width, repeatedValue: Array(count: self.height, repeatedValue: Cell(x: 0, y: 0)))
        
        // Setup the cell grid
        for h in 0..<height {
            
            for w in 0..<width {
                
                // Create the new cell
                let newCell = Cell.init(x: w, y: h)
                
                // Make the cell randomly be alive or dead
                if arc4random_uniform(3) == 1 {
                    
                    newCell.status = .alive
                    //case for being alive or true?
                }
                else  {
                    
                    newCell.status = .dead
                    // case for being dead or false?
                }
                
                // Set the new cell in the grid
                tempArray[h][w] = newCell
            }
            
            self.cells = tempArray
        }
        super.init()
    }

    
    // This function checks the cell's neighbors
    func neighbors(cell: Cell) -> [Cell]? {
        
        let origin = cell.location
        var neighbors = [Cell]()
        
        // Loop through all neighboring locations
        for i in 0...7 {
            
            var xCheck = origin.x
            var yCheck = origin.y
            
            // Check top left neighbor
            if i == 0 {
                
                xCheck -= 1
                yCheck -= 1
            }
            // Check top neighbor
            else if i == 1 {
                
                yCheck -= 1
            }
            // Check the top right neighbor
            else if i == 2 {
                
                xCheck += 1
                yCheck -= 1
            }
            // Check right neighbor
            else if i == 3 {
                
                xCheck += 1
            }
            // Check bottom right neighbor
            else if i == 4 {
                
                xCheck += 1
                yCheck += 1
            }
            // Check bottom neighbor
            else if i == 5 {
                
                yCheck += 1
            }
            // Check bottom right neighbor
            else if i == 6 {
                
                xCheck -= 1
                yCheck += 1
            }
            // Check right neighbor
            else if i == 7 {
                
                xCheck -= 1
            }
            
            if xCheck == origin.x && yCheck == origin.y {
                
                // Something went wrong
                abort()
            }
        
            // Shift grid locations if the y go off the grid itself
            self.shiftGridLocations(&xCheck, y: &yCheck)
        
            // Get reference to the neighbor cell
            let cell = self.cells[yCheck][xCheck]
                        
            // If the cell is alive then save it
            if cell.isAlive {
                
                neighbors.append(cell)
            }
        }
        
        return neighbors
    }

    // This function handles translations when a cell is on the edge of a grid
    func shiftGridLocations(inout x: Int, inout y: Int) {
    
        if x < 0 {
            
            x = self.width - 1
        }
        
        if x > self.width - 1 {
            
            x = 0
        }
        
        if y < 0 {
            
            y = self.height - 1
        }
        
        if y > self.height - 1 {
            
            y = 0
        }
    }
    
    func aliveCount() -> Int {
        
        var aliveCellCount = 0
        
        // Count alive cells
        for row in self.cells {
            
            for cell in row {
                
                if cell.isAlive {
                    
                    aliveCellCount += 1
                }
            }
        }
        
        return aliveCellCount
    }

    // This function creates a string representation of the grid
    func string() -> String {
        
        var stringLog = ""
        
        for h in 0..<height {
            
            for w in 0..<width {
                
                let cell = self.cells[h][w] as Cell
                
                stringLog += "\((cell.status == .alive) ? "X" : "O") "
            }
            
            stringLog += "\n"
        }
        
        stringLog += "\n"
        
        return stringLog
    }
    
    // This function prints the grid to the console
    func print() {
     
        Swift.print(self.string())
    }
}
