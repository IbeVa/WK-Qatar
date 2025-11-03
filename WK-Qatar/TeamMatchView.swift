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
    @State var selectedMatch: WKResult?
    
    var body: some View {
        NavigationSplitView {
            List(dataStore.getAllStadia(), id: \.self, selection: selectedStadiumBinding) { stadium in
                Text(stadium)
            }
        } content: {
                if let selectedStadium = dataStore.selectedStadium {
                    let allMatches = dataStore.selectedStadium(stadium: selectedStadium)
                    List(allMatches, id: \.self, selection: $selectedMatch){ match in
                            Grid{
                                GridRow {
                                    Text(match.homeTeam).frame(maxWidth: .infinity, alignment: .center).foregroundStyle(selectedTeam == match.homeTeam ? .red : .black )
                                    Text("X").frame(maxWidth: .infinity, alignment: .center)
                                    Text(match.awayTeam).frame(maxWidth: .infinity, alignment: .center).foregroundStyle(selectedTeam == match.awayTeam ? .red : .black)
                                }
                                
                                GridRow {
                                    if let score = match.homeTeamScore{
                                        Text(String(score)).frame(maxWidth: .infinity, alignment: .center)
                                        Text("-").frame(maxWidth: .infinity, alignment: .center)
                                    }else{
                                        Text("")
                                    }
                                            
                                    if let score = match.awayTeamScore{
                                        Text(String(score)).frame(maxWidth: .infinity, alignment: .center)
                                    }else{
                                        Text("")
                                    }
                                }
                            }
                        }
                    Divider()
                }else{
                    Text("Selecteer een stadium")
                }
        } detail: {
            if let selectedMatch = selectedMatch{
                VStack{
                    Text("\(selectedMatch.dateUTC)").frame(maxWidth: .infinity, alignment: .leading).padding()
                    Text("\(selectedMatch.location)").font(.largeTitle)
                    Divider()
                    Grid{
                        GridRow {
                            Text(selectedMatch.homeTeam).frame(maxWidth: .infinity, alignment: .center)
                            Text("X").frame(maxWidth: .infinity, alignment: .center)
                            Text(selectedMatch.awayTeam).frame(maxWidth: .infinity, alignment: .center)
                        }
                        
                        GridRow {
                            if let score = selectedMatch.homeTeamScore{
                                Text(String(score)).frame(maxWidth: .infinity, alignment: .center)
                                Text("-").frame(maxWidth: .infinity, alignment: .center)
                            }else{
                                Text("")
                            }
                            
                            if let score = selectedMatch.awayTeamScore{
                                Text(String(score)).frame(maxWidth: .infinity, alignment: .center)
                            }else{
                                Text("")
                            }
                        }
                        Divider()
                    }
                    VStack(){
                        Text("Round: \(selectedMatch.roundNumber)").frame(maxWidth: .infinity,alignment: .leading)
                        if let groep = selectedMatch.group{
                            Text("Group: \(groep)").frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }.padding()
                }
            }
        }.navigationTitle("WKQatar2022")

    }
}


