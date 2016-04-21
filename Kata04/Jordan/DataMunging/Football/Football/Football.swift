//
//  Football.swift
//  Football
//
//  Created by Jordan Camara on 4/19/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation
import DifferenceCommon

class Football: DifferenceDataMunger {
    init(data: String) {
        let config = DifferenceDataMungerConfig(nameIndex: 1, minuendIndex: 6, subtrahendIndex: 8)
        super.init(data: data, config: config)
    }
}