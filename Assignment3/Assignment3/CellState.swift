//
//  CellState.swift
//  Assignment3
//
//  Created by Dan November on 7/10/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import Foundation


enum CellState: String {
    case Living = "Living"
    case Empty = "Empty"
    case Born = "Born"
    case Died = "Died"
    
    // return the raw value for a cell state
    var description: String {
        switch (self) {
        case .Living:
            return CellState.Living.rawValue
        case .Empty:
            return CellState.Empty.rawValue
        case .Born:
            return CellState.Born.rawValue
        case .Died:
            return CellState.Died.rawValue
        }
    }
    
    
    //return an array of cellstate options .
    //        var allValues: Array<String> -> [CellState] {
    //            var tmpArray = []
    //            for x in CellState {
    //                x
    //            }
    //        }
    
    
    
    // toggle between alive and dead
    func toggle() -> CellState {
        switch self {
        case .Empty,.Died:
            return .Living
        case .Living, .Born:
            return .Empty
        }
    }
}