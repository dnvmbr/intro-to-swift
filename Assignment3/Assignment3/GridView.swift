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
    
    
    
    //Create a two dimensional array that returns type cellstate
    var grid:Array<Array<CellState>> {
        for col in 0..<cols {
            for row in 0..<rows {
               // initialize a new item to .Empty
            }
        }
//        didSet {
//            //reinitialize twoDArray cells to .Empty
//        }
        return grid
    }
    
    
    func ACell() {
        override func drawRect(rect: CGRect) {
            var path = UIBezierPath(ovalInRect: rect)
            UIColor.greenColor().setFill()
            path.fill()
    }
    
    
    //Draw Grid and Cells
    override func drawRect(rect: CGRect) {
        
        //        var path = UIBezierPath(ovalInRect: rect)
        //        UIColor.greenColor().setFill()
        //        path.fill()
        
        
        //function for distributing equally
        func gridMakerCols() {
            
            //set up the width and height variables
            //for the horizontal stroke
            let plusHeight: CGFloat = 3.0
            let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
            
            //create the spacing
            let spacer = bounds.width / CGFloat(cols)
            
            //keep track of the spacing location
            var tracker:CGFloat = 0
            
            for col in 0..<cols {
                //create the path
                var plusPath = UIBezierPath()
                
                //set the path's line width to the height of the stroke
                plusPath.lineWidth = plusHeight
                
                //move to the start of the vertical stroke
                plusPath.moveToPoint(CGPoint(
                    x:bounds.width + tracker,
                    y:bounds.height/2 - plusWidth/2 + 0.5))
                
                //add the end point to the vertical stroke
                plusPath.addLineToPoint(CGPoint(
                    x:bounds.width/2 + 0.5,
                    y:bounds.height/2 + plusWidth/2 + 0.5))
                
                //set the stroke color
                UIColor.whiteColor().setStroke()
                
                //draw the stroke
                plusPath.stroke()
                
                tracker += spacer
            }
        }
    }
    
}