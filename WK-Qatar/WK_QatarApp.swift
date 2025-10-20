//
//  WK_QatarApp.swift
//  WK-Qatar
//
//  Created by Ibe Vangheluwe on 20/10/2025.
//

import SwiftUI

@main
struct WK_QatarApp: App {
    @State var wkDataStore = DataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(wkDataStore)
        }
    }
}
