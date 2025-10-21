//
//  ListTeamView.swift
//  WK-Qatar
//
//  Created by Ibe Vangheluwe on 20/10/2025.
//

import SwiftUI

struct ListTeamView: View {
    var teams : [String]
    @Binding var selectedTeam : String?
    var body: some View {
        Text("WK QATAR 2020").frame(maxWidth: .infinity, alignment: .center).padding(20).bold(true).font(Font.largeTitle)
        Text("Select your favorite team")
        List(teams, id:  \.self, selection: $selectedTeam) { team in
            Text(team).foregroundStyle(selectedTeam == team ? .red : .black)
        }
    }
}


