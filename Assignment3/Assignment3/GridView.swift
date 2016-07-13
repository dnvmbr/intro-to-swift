//
//  GridView.swift
//  Assignment3
//
//  Created by Dan November on 7/9/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import Foundation
import UIKit

//Create a two dimensional array that returns type cellstate
class TwoDimensional {
    
    let rows : Int
    let cols : Int
    
    //tuple location
    var lastState = (0,0)
    
    var grid: [[CellState]] {
        didSet {
            //if cellstate changes, redraw cell
            //                grid[row][col] =
        }
    }
    
    init(rows: Int, cols: Int) {
        
        self.rows = rows
        self.cols = cols
        
        // Set it to cellstate empty
        grid = Array(count: rows, repeatedValue:[CellState](count:cols, repeatedValue: CellState.Empty))
        
    }
    
    //change the cell when clicked
    func changeCellState(row: Int, col: Int, newState:CellState) {
        
        //keep track of location
        lastState = (row, col)
        
        //change the grid
        grid[row][col] = newState
        
    }
    
    func convertPointToGridItem(point: CGPoint, frame: CGRect) -> (Int,Int) {
        
        let cellWidth = frame.size.width / CGFloat(self.rows)
        let cellHeight = frame.size.height / CGFloat(self.cols)
        
        // how many times can the point be divided by spacing
        return (Int(point.x / cellWidth),Int(point.y / cellHeight))
        
    }
}

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
    
    //initialize the frame you're working in and the grid
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.initialize()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    func initialize() {
        
        self.lifeGrid = TwoDimensional(rows: self.rows, cols: self.cols)
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
        
        //draw the shapes
        drawVertLines()
        drawHorizontalLines()
        
        drawCircles()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            self.processTouch(touch)

        }
    }
    
    func processTouch(touch: UITouch) {
        
        let point = touch.locationInView(self)
        
        //Convert current point to a grid location
        let (x,y) = lifeGrid.convertPointToGridItem(point, frame: self.frame)

        lifeGrid.grid[x][y].toggle()
        self.setNeedsDisplay()
    }
}
