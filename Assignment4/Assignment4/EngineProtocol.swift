//
//  EngineProtocol.swift
//  Assignment4
//
//  Created by Dan November on 7/18/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import Foundation

protocol EngineProtocol {
    var delegate: EngineDelegate { get set }
    var grid: GridProtocol { get }
    var refreshRate: Double { get set }
    var refreshTimer: NSTimer { get set }
    var rows: UInt { get }
    var cols: UInt { get }
    //an initializer taking rows and cols
//    init(rows, cols)
    func step()-> GridProtocol
    
}