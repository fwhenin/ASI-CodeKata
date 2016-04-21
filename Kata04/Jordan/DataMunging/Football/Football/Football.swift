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
    
    init(data: String) {
        self.data = processData(data, nameIndex: 1, minuendIndex: 6, subtrahendIndex: 8, ignoreRows: 0, 18)
    }
    
    func getTeamWithMinScoreDifference() -> String {
        let minTeam = data.minElement { $0.difference < $1.difference }!.name
        return minTeam
    }
    
    private func processData(data: String, nameIndex: Int, minuendIndex: Int, subtrahendIndex: Int, ignoreRows: Int...) -> [DifferenceData] {
        var result = [DifferenceData]()
        
        // split file by lines
        let lines = data.characters.split("\n")
        for (index, line) in lines.enumerate() {
            if !ignoreRows.contains(index) {
                
                // split into columns
                let columns = line.split(" ").map(String.init)
                
                // convert the minuend and subtrahend and calculate the difference up front
                let minuend = Double(columns[minuendIndex])!
                let subtrahend = Double(columns[subtrahendIndex])!
                let differenceData = DifferenceData(name: columns[nameIndex], difference: abs(minuend - subtrahend))
                
                // append to result
                result.append(differenceData)
            }
        }
        
        return result
    }
    
}