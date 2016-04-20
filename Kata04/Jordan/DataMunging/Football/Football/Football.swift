//
//  Football.swift
//  Football
//
//  Created by Jordan Camara on 4/19/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation

class Football {
    var data: [[String]]!
    
    init(data: String) {
        self.data = processData(data)
    }
    
    func getTeamWithMinScoreDifference() -> String {
        var minTeam = ""
        var minScoreDifference = Double(Int.max)
        for team in data[1..<data.endIndex] {
            if team.count > 1 {
                let forScore = Double(team[6])!
                let againstScore = Double(team[8])!
                let currentDifference = abs(forScore - againstScore)
                if currentDifference < minScoreDifference {
                    minTeam = team[1]
                    minScoreDifference = currentDifference
                }
            }
        }
        return minTeam
    }
    
    private func processData(data: String) -> [[String]] {
        let result = data.characters.split("\n").map { $0.split(" ").map(String.init) }
        return result
    }
}