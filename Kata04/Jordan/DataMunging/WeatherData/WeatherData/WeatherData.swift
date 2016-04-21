//
//  WeatherData.swift
//  WeatherData
//
//  Created by Jordan Camara on 4/19/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation
import DifferenceCommon

class WeatherData: DifferenceDataMunger {
    init(data: String) {
        let config = DifferenceDataMungerConfig(nameIndex: 0, minuendIndex: 1, subtrahendIndex: 2, ignoreRows: [0])
        super.init(data: data, config: config)
    }
}