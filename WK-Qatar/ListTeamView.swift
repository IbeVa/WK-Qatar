//
//  ListTeamView.swift
//  WK-Qatar
//
//  Created by Ibe Vangheluwe on 20/10/2025.
//

import SwiftUI

struct ListTeamView: View {
    var teams : [WKResult]
    @State var selectedTeam : String?
    var body: some View {
        List(teams, id: \.self, selection: $selectedTeam) { team in
            Text(team.)
        }
    }
}

