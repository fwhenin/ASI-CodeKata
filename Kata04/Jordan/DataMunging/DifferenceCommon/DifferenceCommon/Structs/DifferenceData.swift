//
//  DifferenceData.swift
//  Difference.Common
//
//  Created by Jordan Camara on 4/20/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation

public struct DifferenceData {
    var name: String
    var difference: Double
    
    public init(name: String, difference: Double) {
        self.name = name
        self.difference = difference
    }
}