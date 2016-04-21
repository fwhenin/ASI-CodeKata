//
//  DifferenceDataMunger.swift
//  Difference.Common
//
//  Created by Jordan Camara on 4/20/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation

private let kTrimCharacterSet = NSCharacterSet(charactersInString: "*")

public class DifferenceDataMunger {
    var data: String
    var config: DifferenceDataMungerConfig
    
    public init(data: String, config: DifferenceDataMungerConfig) {
        self.data = data
        self.config = config
    }
    
    public func getMinDifferenceName() -> String {
        var dataArray = [DifferenceData]()
        
        // split file by lines
        let lines = data.characters.split("\n")
        for (index, line) in lines.enumerate() {
            if !config.ignoreRows.contains(index) {
                
                // split into columns
                let columns = line.split(" ").map(String.init)
                
                // convert the minuend and subtrahend and calculate the difference
                let minuend = Double(columns[config.minuendIndex].stringByTrimmingCharactersInSet(kTrimCharacterSet))!
                let subtrahend = Double(columns[config.subtrahendIndex].stringByTrimmingCharactersInSet(kTrimCharacterSet))!
                let differenceData = DifferenceData(name: columns[config.nameIndex], difference: abs(minuend - subtrahend))
                
                // append to result
                dataArray.append(differenceData)
            }
        }
        
        let result = dataArray.minElement { $0.difference < $1.difference }!.name
        
        return result
    }
}