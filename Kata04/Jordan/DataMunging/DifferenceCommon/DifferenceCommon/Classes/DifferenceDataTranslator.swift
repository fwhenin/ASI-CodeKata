//
//  DifferenceDataTranslator.swift
//  DifferenceCommon
//
//  Created by Jordan Camara on 4/20/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation

private let kTrimCharacterSet = NSCharacterSet(charactersInString: "*")

public class DifferenceDataTranslator {
    
    public func toDifferenceDataArray(data: String, config: DifferenceDataMungerConfig) -> [DifferenceData] {
        var result = [DifferenceData]()
        
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
                result.append(differenceData)
            }
        }
        
        return result
    }
}