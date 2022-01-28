//
//  ContentView.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var navBarTitle = "MovieDB"
    var body: some View {
        NavigationView {
            TabView {
                HomeTabItem(navBarTitle: $navBarTitle)
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .navigationTitle(navBarTitle)
                PopulerTabItem(navBarTitle: $navBarTitle)
                    .tabItem {
                        Image(systemName: "rosette")
                    }
                    .navigationTitle(navBarTitle)
                FavoriteTabItem(navBarTitle: $navBarTitle)
                    .tabItem {
                        Image(systemName: "heart")
                    }
                    .navigationTitle(navBarTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
