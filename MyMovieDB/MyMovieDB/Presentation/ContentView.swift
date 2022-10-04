//
//  ContentView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct ContentView: View {

    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            Group {
                HomeTabView()
            }
            .navigationBarItems(trailing: HStack {
                settingsButton
            })
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
        }
    }
    
    private var settingsButton: some View {
        Button {
            showSettings.toggle()
        } label: {
            Image(systemName: "gear")
                .foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
