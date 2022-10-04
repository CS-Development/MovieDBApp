//
//  ContentView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        NavigationView {
            Group {
                HomeTabView()
            }
            //.sheet(settings)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
