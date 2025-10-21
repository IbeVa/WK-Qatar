//
//  TeamMatchView.swift
//  WK-Qatar
//
//  Created by Ibe Vangheluwe on 21/10/2025.
//

import SwiftUI

struct TeamMatchView: View {
    @Environment(DataStore.self) var dataStore
    var selectedTeam : String
    @State var selectedStadium : String?
    var body: some View {
        NavigationSplitView {
            List(dataStore.getAllStadia(), id: \.self, selection: $selectedStadium) { stadium in
                Text(stadium)
            }
        } content: {
            Grid{
                if let selectedStadium = selectedStadium {
                    let allMatches = dataStore.selectedStadium(stadium: selectedStadium)
                    GridRow{
                        VStack{
                            ForEach(allMatches, id: \.self) { match in
                                HStack{
                                    VStack{
                                        Text(match.homeTeam).frame(maxWidth: .infinity, alignment: .center).foregroundStyle(Color(selectedTeam == match.homeTeam ? .red : .black))
                                        if let score = match.homeTeamScore{
                                            Text(String(score)).frame(maxWidth: .infinity, alignment: .center)
                                        }
                                    }
                                    Spacer()
                                    VStack{
                                        Text("X").frame(maxWidth: .infinity, alignment: .center)
                                        Text("-").frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    Spacer()
                                    VStack{
                                        Text(match.awayTeam).frame(maxWidth: .infinity, alignment: .center).foregroundStyle(Color(selectedTeam == match.awayTeam ? .red : .black))
                                        if let score = match.awayTeamScore{
                                            Text(String(score)).frame(maxWidth: .infinity, alignment: .center)
                                        }
                                    }
                                }
                                Divider()
                            }
                        }
                        
                    }
                }
            }
        } detail: {
            Text("Test")
        }.navigationTitle("WKQatar2022")

    }
}


