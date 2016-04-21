//
//  DifferenceProcessConfig.swift
//  Difference.Common
//
//  Created by Jordan Camara on 4/20/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation

public struct DifferenceDataMungerConfig {
    var nameIndex: Int
    var minuendIndex: Int
    var subtrahendIndex: Int
    
    public init(nameIndex: Int, minuendIndex: Int, subtrahendIndex: Int) {
        self.nameIndex = nameIndex
        self.minuendIndex = minuendIndex
        self.subtrahendIndex = subtrahendIndex
    }
}