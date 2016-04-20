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
    var data: [[String]]!
    
    init(data: String) {
        self.data = processData(data)
    }
    
    func getDayWithMinSpread() -> String {
        var minDay = ""
        var minTempRange = Double(Int.max)
        for day in data[1..<data.endIndex] {
            let max = Double(day[1].stringByTrimmingCharactersInSet(kTrimCharacterSet))!
            let min = Double(day[2].stringByTrimmingCharactersInSet(kTrimCharacterSet))!
            let currentRange = max - min
            if (currentRange < minTempRange) {
                minDay = day[0]
                minTempRange = currentRange
            }
        }
        
        return minDay
    }
    
    private func processData(data: String) -> [[String]] {
        let result = data.characters.split("\n").map { $0.split(" ").map(String.init) }
        return result
    }
}