//
//  DataStore.swift
//  WK-Qatar
//
//  Created by Ibe Vangheluwe on 20/10/2025.
//

import Foundation

@Observable
class DataStore {
    var results : [WKResult]
    
    var selectedMatch: WKResult?
    private var _selectedStadium: String?
    var selectedStadium: String?{
        get {
            return _selectedStadium
        }set{
            selectedMatch = nil
            _selectedStadium = newValue
        }
    }
    
    init() {
        results = load("WKResultsQatar.json")
    }
    
    func getAllTeams() -> [String] {
        let resultMap = results.map { wkResult in
            wkResult.homeTeam
        }
        let teams = resultMap.filter { wkResult in
            !wkResult.starts(with: "1") && !wkResult.starts(with: "2") && !wkResult.contains("To be announced")
        }
        
        return Array(Set(teams)).sorted()
    }
    
    func getAllStadia() -> [String] {
        let resultMap = results.map { wkResult in
            wkResult.location
        }
        
        let stadiums = resultMap.filter { wkResult in
            !wkResult.starts(with: "TBA")
        }
        
        return Array(Set(stadiums)).sorted()
    }
    
    func selectedStadium(stadium : String) -> [WKResult] {
        let allMatches = results.filter { wkResult in
            wkResult.location == stadium
        }
        
        return allMatches
    }
}
