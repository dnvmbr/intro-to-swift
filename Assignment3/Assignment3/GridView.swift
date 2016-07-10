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
    let lineWidthMaster: CGFloat = 1.0
    
    //Create a two dimensional array that returns type cellstate
//    var grid:Array<Array<CellState>> {
//        for col in 0..<cols {
//            for row in 0..<rows {
//                // initialize a new item to .Empty
//                            }
//        }
//        //        didSet {
//        //            //reinitialize twoDArray cells to .Empty
//        //        }
//        return grid
//    }
    
    
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
            
            print("bounds: \(bounds.width) left: \(left) location: \(location) myspace: \(mySpace)")
        }
    }
    
    func drawHorizontalLines() {
        let newCols = CGFloat(cols)
        let mySpace = bounds.height/newCols
        
        
        for top in 0..<cols {
            let location = mySpace * CGFloat(top)
            
            drawLine(CGPointMake(0, location), end: CGPointMake(bounds.width, location))
            
            print("bounds: \(bounds.width) left: \(top) location: \(location) myspace: \(mySpace)")
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
                UIColor.greenColor().setStroke()
                UIColor.greenColor().setFill()
                newCircle.stroke()
                newCircle.fill()
            }
        }
    }

    
    
    //Draw Grid and Cells
    override func drawRect(rect: CGRect) {
        
        self.drawVertLines()
        self.drawHorizontalLines()
        self.drawCircles()
        
    }
}