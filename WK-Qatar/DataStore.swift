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
    
    init() {
        results = load("WKResult.json")
    }
    
    func getAllTeams() -> [String] {
        
    }
}
