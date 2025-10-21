//
//  ContentView.swift
//  WK-Qatar
//
//  Created by Ibe Vangheluwe on 20/10/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(DataStore.self) var dataStore
    @State private var selectedTeam : String?
    var body: some View {
        NavigationStack{
            ListTeamView(teams: dataStore.getAllTeams(), selectedTeam: $selectedTeam)
            
            if let selectedTeam = selectedTeam{
                NavigationLink("Next") {
                        TeamMatchView(selectedTeam: selectedTeam)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
