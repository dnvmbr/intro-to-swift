//
//  GridView.swift
//  Assignment3
//
//  Created by Dan November on 7/9/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class GridView: UIView {
    @IBInspectable var rows: Int = 20
    @IBInspectable var cols: Int = 20
    
    @IBInspectable var bornColor: UIColor =  UIColor.yellowColor()
    @IBInspectable var livingColor: UIColor = UIColor.greenColor()
    @IBInspectable var emptyColor: UIColor = UIColor.darkGrayColor()
    @IBInspectable var diedColor: UIColor = UIColor.redColor()
    @IBInspectable var gridColor: UIColor = UIColor.grayColor()
    
    @IBInspectable var gridWidth: CGFloat = 0.0
    
    let space: CGFloat = 0.0
    let lineWidthMaster:CGFloat = 1.0
    
    var lifeGrid: TwoDimensional!
    
    //Create a two dimensional array that returns type cellstate
    class TwoDimensional {
        
        let rows : Int
        let cols : Int
        
        //tuple location
        var lastState = (0,0)
        
        var grid: [[CellState]] {
            didSet {
                //meh
            }
        }
        
        init(rows: Int, cols: Int) {
            
            self.rows = rows
            self.cols = cols
            
            // Set it to cellstate empty
            grid = Array(count: rows, repeatedValue:[CellState](count:cols, repeatedValue: CellState.Empty))
            
        }
        
//        //change the cell when clicked
//        func changeCellState(row: Int, col: Int, newState:CellState) {
//            
//            //keep track of location
//            lastState = (row, col)
//            
//            //change the grid
//            grid[row][col] = newState
//            
//        }
        
        func convertPointToGridItem(point:CGPoint) -> (Int,Int) {
            
            let rows = 20
            
            // vertical spacing
            let spacing = (container.bounds.height) / CGFloat(rows)
            
            let yValue = point.y / spacing
            let xValue = point.x / spacing
            
            // how many times can the point be divided by spacing
            return (Int(xValue),Int(yValue))
            
        }
    }
    
    
    func drawLine(start: CGPoint, end:CGPoint) {
        
        let linePath = UIBezierPath()
        
        linePath.lineWidth = lineWidthMaster
        linePath.moveToPoint(start)
        linePath.addLineToPoint(end)
        
        UIColor.whiteColor().setStroke()
        linePath.stroke()
        
    }
    
    func drawVertLines() {
        
        let newCols = CGFloat(cols)
        let mySpace = bounds.width/newCols
        
        for left in 0..<cols {
            let location = mySpace * CGFloat(left)
            
            drawLine(CGPointMake(location, 0), end: CGPointMake(location, bounds.height))
        }
    }
    
    func drawHorizontalLines() {
        
        let newCols = CGFloat(cols)
        let mySpace = bounds.height/newCols
        
        
        for top in 0..<cols {
            let location = mySpace * CGFloat(top)
            
            drawLine(CGPointMake(0, location), end: CGPointMake(bounds.width, location))
            
        }
    }
    
    func drawCircles() {
        
        let cellWidth = bounds.width/CGFloat(cols)
        let circleHeight = cellWidth * 0.5
        let circleWidth = circleHeight
        
        let xCirlcePosition = circleHeight/2
        let yCirclePosition = circleWidth/2
        
        //populate the grid with circles
        for col in 0..<cols {
            for row in 0..<rows {
                
                //create a new circle
                let newCircle = UIBezierPath(ovalInRect: CGRectMake(xCirlcePosition + (CGFloat(row) * cellWidth), yCirclePosition + (CGFloat(col) * cellWidth), circleWidth, circleHeight))

                
                //get your drawing on
                if lifeGrid.grid[row][col] == .Empty {
                    UIColor.redColor().setStroke()
                    UIColor.redColor().setFill()
                    
                } else {
                    UIColor.greenColor().setStroke()
                    UIColor.greenColor().setFill()
                    
                }
                
                newCircle.stroke()
                newCircle.fill()
                
            }
        }
    }
    
    //Draw Grid and Cells
    override func drawRect(rect: CGRect) {
        
        //create the grid
        lifeGrid = TwoDimensional(rows: self.rows, cols: self.cols)
        
        //draw the shapes
        self.drawVertLines()
        self.drawHorizontalLines()
        self.drawCircles()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            self.processTouch(touch)
            
        }
    }
    
    func processTouch(touch: UITouch) {
        
        let point = touch.locationInView(self)
        
        //Convert current point to a grid location
        let (x,y) = lifeGrid.convertPointToGridItem(point)
        
        lifeGrid.grid[x][y].toggle()
        self.setNeedsDisplay()

    }
}

//get information about the view you are in.
let container = GridView(frame: CGRect(x: 0.0, y: 0.0, width: 400, height: 400))
