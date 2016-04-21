//
//  Football.swift
//  Football
//
//  Created by Jordan Camara on 4/19/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation

class Football {
    var data: [DifferenceData]!
    
    internal struct DifferenceData {
        var name: String
        var difference: Double
        
        init(name: String, difference: Double) {
            self.name = name
            self.difference = difference
        }
    }
    
    internal struct DifferenceProcessorConfig {
        var nameIndex: Int
        var minuendIndex: Int
        var subtrahendIndex: Int
        var ignoreRows: [Int]
        
        init(nameIndex: Int, minuendIndex: Int, subtrahendIndex: Int, ignoreRows: [Int]) {
            self.nameIndex = nameIndex
            self.minuendIndex = minuendIndex
            self.subtrahendIndex = subtrahendIndex
            self.ignoreRows = ignoreRows
        }
    }
    
    init(data: String) {
        let config = DifferenceProcessorConfig(nameIndex: 1, minuendIndex: 6, subtrahendIndex: 8, ignoreRows: [0, 18])
        self.data = processData(data, config: config)
    }
    
    func getTeamWithMinScoreDifference() -> String {
        let minTeam = data.minElement { $0.difference < $1.difference }!.name
        return minTeam
    }
    
    private func processData(data: String, config: DifferenceProcessorConfig) -> [DifferenceData] {
        var result = [DifferenceData]()
        
        // split file by lines
        let lines = data.characters.split("\n")
        for (index, line) in lines.enumerate() {
            if !config.ignoreRows.contains(index) {
                
                // split into columns
                let columns = line.split(" ").map(String.init)
                
                // convert the minuend and subtrahend and calculate the difference up front
                let minuend = Double(columns[config.minuendIndex])!
                let subtrahend = Double(columns[config.subtrahendIndex])!
                let differenceData = DifferenceData(name: columns[config.nameIndex], difference: abs(minuend - subtrahend))
                
                // append to result
                result.append(differenceData)
            }
        }
        
        return result
    }
    
}