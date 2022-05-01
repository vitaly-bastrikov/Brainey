//
//  RootView.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-23.
//

import SwiftUI

struct RootView: View {
    @State var tabSelected: String = "Settings"
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        TabView(selection: $tabSelected, content: {
            SettingsView(tabSelected: $tabSelected)
                .id(appState.rootViewId)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag("Settings")
            
            StatisticView()
                .tabItem {
                    Label("Statistics", systemImage: "chart.line.uptrend.xyaxis")
                }
                .tag("Statistics")
        })
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

