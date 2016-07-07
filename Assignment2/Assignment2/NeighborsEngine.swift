//
//  Engine1.swift
//  Assignment2
//
//  Created by Dan November on 7/5/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import Foundation

/*  Extract the logic for computing neighbors of a cell according to the wrapping rules into a top-level function called neighbors() which accepts a tuple of row-column coordinates and returns an array of row-column tuples of coordinates where each member of the returned array is a different neighbor of the input coordinate. Repeat Problem 3 only invoking creating a function called step2() which invokes neighbors() instead of directly embedding that functionality.
*/


//logic for seeing which neighbor is alive
func step2() {
    
    let width: Int
    let height: Int

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
            shiftGridLocations(&xCheck, y: &yCheck)
            
            // Get reference to the neighbor cell
            let cell = cells[yCheck][xCheck]
            
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
            
            x = width - 1
        }
        
        if x > width - 1 {
            
            x = 0
        }
        
        if y < 0 {
            
            y = height - 1
        }
        
        if y > height - 1 {
            
            y = 0
        }
    }
    
    func aliveCount() -> Int {
        
        var aliveCellCount = 0
        
        // Count alive cells
        for row in cells {
            
            for cell in row {
                
                if cell.isAlive {
                    
                    aliveCellCount += 1
                }
            }
        }
        
        return aliveCellCount
    }
    
}