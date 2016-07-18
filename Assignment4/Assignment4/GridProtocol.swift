//
//  GridProtocol.swift
//  Assignment4
//
//  Created by Dan November on 7/17/16.
//  Copyright © 2016 Dan November. All rights reserved.
//

import Foundation

protocol GridProtocol {
    var rows: UInt { get }
    var cols: UInt { get }
    //func neighbors()
    //subscript (rows: UInt, cols: UInt) -> CellState { get set }
}