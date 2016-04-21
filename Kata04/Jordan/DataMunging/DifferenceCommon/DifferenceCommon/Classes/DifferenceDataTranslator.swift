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
        let minuendIndex = config.minuendIndex
        let subtrahendIndex = config.subtrahendIndex
        
        // split file by lines
        for line in data.characters.split("\n") {
            
            // split into columns
            let columns = line.split(" ").map(String.init)
            let columnIndices = columns.indices
            
            // convert the minuend and subtrahend and calculate the difference
            if columnIndices.contains(minuendIndex) && columnIndices.contains(subtrahendIndex) {
                if let minuend = toDouble(columns[minuendIndex]),
                    let subtrahend = toDouble(columns[subtrahendIndex])
                    where minuendIndex < columns.count && subtrahendIndex < columns.count {
                    
                    let differenceData = DifferenceData(name: columns[config.nameIndex], difference: abs(minuend - subtrahend))
                    
                    // append to result
                    result.append(differenceData)
                }
            }
        }
        
        return result
    }
    
    private func toDouble(data: String) -> Double? {
        return Double(data.stringByTrimmingCharactersInSet(kTrimCharacterSet))
    }
}