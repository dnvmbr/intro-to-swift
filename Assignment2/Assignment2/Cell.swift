//
//  Cell.swift
//  Assignment2
//
//  Created by Dan November on 7/4/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import UIKit

struct GridLocation {
    var x: Int
    var y: Int
}

enum Status {
    case alive
    case dead
    case starved
    case overpopulated
    case reproduced
    case unknown
}

class Cell: NSObject {

    var location: GridLocation
    var status: Status
    
    var isAlive: Bool {
        
        switch(self.status) {
        case .alive,
             .reproduced:
            return true
            
        case .overpopulated,
             .starved,
             .dead:
            return false
            
        default:
            return false
        }
    }
    
    required init(x: Int, y: Int) {
        
        self.location = GridLocation(x: x, y: y)
        self.status = .unknown
        super.init()
    }
}
