//
//  DifferenceDataMunger.swift
//  Difference.Common
//
//  Created by Jordan Camara on 4/20/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation

public class DifferenceDataMunger {
    var data: String
    var config: DifferenceDataMungerConfig
    var translator = DifferenceDataTranslator()
    
    public init(data: String, config: DifferenceDataMungerConfig) {
        self.data = data
        self.config = config
    }
    
    public func getMinDifferenceName() -> String {
        let dataArray = translator.toDifferenceDataArray(data, config: config)
        let result = dataArray.minElement { $0.difference < $1.difference }!.name
        return result
    }
}