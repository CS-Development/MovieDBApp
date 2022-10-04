//
//  HomeTabView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 04.10.22.
//

import SwiftUI

struct HomeTabView: View {
    
    enum Tab: Int {
        case movie
        case discover
    }
    
    @State private var selectedTab = Tab.movie
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView().tabItem {
                tabBarItem(text: "Movies", image: "film")
                            }
            DiscoverView().tabItem {
                tabBarItem(text: "Discover", image: "square.stack")
            }
        }
    }
    
    private func tabBarItem(text: String, image: String) -> some View {
        VStack{
            Image(systemName: image)
            Text(text)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
