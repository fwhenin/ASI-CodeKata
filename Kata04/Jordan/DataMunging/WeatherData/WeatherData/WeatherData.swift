//
//  WeatherData.swift
//  WeatherData
//
//  Created by Jordan Camara on 4/19/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation

let kTrimCharacterSet = NSCharacterSet.decimalDigitCharacterSet().invertedSet

class WeatherData {
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
        self.data = processData(data)
    }
    
    func getDayWithMinSpread() -> String {
        let minDay = data.minElement { $0.difference < $1.difference }!.name
        return minDay
    }
    
    private func processData(data: String) -> [DifferenceData] {
        var result = [DifferenceData]()
        
        // split file by lines
        let lines = data.characters.split("\n")
        for line in lines[1..<lines.endIndex] {
            
            // split into columns
            let columns = line.split(" ").map(String.init)
            
            // convert the minuend and subtrahend and calculate the difference up front
            let minuend = Double(columns[1].stringByTrimmingCharactersInSet(kTrimCharacterSet))!
            let subtrahend = Double(columns[2].stringByTrimmingCharactersInSet(kTrimCharacterSet))!
            let differenceData = DifferenceData(name: columns[0], difference: abs(minuend - subtrahend))
            
            // append to result
            result.append(differenceData)
        }
        
        return result
    }
}