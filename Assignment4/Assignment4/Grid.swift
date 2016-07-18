//
//  Grid.swift
//  Assignment4
//
//  Created by Dan November on 7/17/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import Foundation
import UIKit

class Grid: GridProtocol {
    
    var rows: UInt {
        get{
            return 10
        }
    }
    
    var cols: UInt {
        get{
            return 10
        }
    }
    
//    private var timer:NSTimer?
//    
//
//    var refreshInterval: NSTimeInterval = 0 {
//        didSet {
//            if refreshInterval != 0 {
//                if let timer = timer { timer.invalidate() }
//                let sel = #selector(Grid.timerDidFire(_:))
//                timer = NSTimer.scheduledTimerWithTimeInterval(refreshInterval,
//                                                               target: self,
//                                                               selector: sel,
//                                                               userInfo: ["name": "fred"],
//                                                               repeats: true)
//            }
//            else if let timer = timer {
//                timer.invalidate()
//                self.timer = nil
//            }
//        }
//    }
//    
//    @objc func timerDidFire(timer:NSTimer) {
//        self.rows += 1
//        let center = NSNotificationCenter.defaultCenter()
//        let n = NSNotification(name: "ExampleNotification",
//                               object: nil,
//                               userInfo: ["name": "fred"])
//        center.postNotification(n)
//        print ("\(timer.userInfo?["name"] ?? "not fred")")
//    }
}