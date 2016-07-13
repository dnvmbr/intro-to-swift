////
////  Neighbors.swift
////  Assignment3
////
////  Created by Dan November on 7/12/16.
////  Copyright © 2016 Dan November. All rights reserved.
////
//
//import Foundation
//
//func step(rows: Int, cols: Int) {
//    for row in rows {
//        for col in cols {
//            neighbors([row],[col])
//
//        }
//    }
//}
//
//
//// This function checks the cell's neighbors
//func neighbors(cell: CellState) -> [CellState]? {
//    
//    //who am i
//    let origin = self.location
//    
//    //create empty array for my 8 neighbors
//    var neighbors = [CellState]()
//    
//    // Loop through all neighboring locations
//    for i in 0...7 {
//        
//        var xCheck = origin.x
//        var yCheck = origin.y
//        
//        // Check top left neighbor
//        if i == 0 {
//            
//            xCheck -= 1
//            yCheck -= 1
//        }
//        // Check top neighbor
//        else if i == 1 {
//            
//            yCheck -= 1
//        }
//        // Check the top right neighbor
//        else if i == 2 {
//            
//            xCheck += 1
//            yCheck -= 1
//        }
//        // Check right neighbor
//        else if i == 3 {
//            
//            xCheck += 1
//        }
//        // Check bottom right neighbor
//        else if i == 4 {
//            
//            xCheck += 1
//            yCheck += 1
//        }
//        // Check bottom neighbor
//        else if i == 5 {
//            
//            yCheck += 1
//        }
//        // Check bottom right neighbor
//        else if i == 6 {
//            
//            xCheck -= 1
//            yCheck += 1
//        }
//        // Check right neighbor
//        else if i == 7 {
//            
//            xCheck -= 1
//        }
//        
//        if xCheck == origin.x && yCheck == origin.y {
//            
//            // Something went wrong
//            abort()
//        }
//        
//        // Shift grid locations if the y go off the grid itself
//        shiftGridLocations(&xCheck, y: &yCheck)
//        
//        // Get reference to the neighbor cell
//        let cell = GridView[yCheck][xCheck]
//        
//        // If the cell is alive then save it
//        if cell.isAlive {
//            
//            neighbors.append(cell)
//        }
//    }
//    
//    return neighbors
//}
//
//// This function handles translations when a cell is on the edge of a grid
//func shiftGridLocations(inout x: Int, inout y: Int) {
//    
//    if x < 0 {
//        
//        x = width - 1
//    }
//    
//    if x > width - 1 {
//        
//        x = 0
//    }
//    
//    if y < 0 {
//        
//        y = height - 1
//    }
//    
//    if y > height - 1 {
//        
//        y = 0
//    }
//}
//
//func aliveCount() -> Int {
//    
//    var aliveCellCount = 0
//    
//    // Count alive cells
//    for row in cells {
//        
//        for cell in row {
//            
//            if cell.isAlive {
//                
//                aliveCellCount += 1
//            }
//        }
//    }
//    
//    return aliveCellCount
//}