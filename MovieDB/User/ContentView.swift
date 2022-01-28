//
//  ContentView.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI

struct ContentView: View {
    init() {
        let standardAppearance = UITabBarAppearance()
        UITabBar.appearance().backgroundColor = UIColor(Color.backgroundBar)
        standardAppearance.backgroundColor = UIColor(Color.backgroundBar)
        UITabBar.appearance().standardAppearance = standardAppearance
    }
    var body: some View {
        NavigationView {
            TabView {
                HomeTabItem()
                    .tabItem {
                        Image(systemName: "house")
                    }
                PopulerTabItem()
                    .tabItem {
                        Image(systemName: "rosette")
                    }
                FavoriteTabItem()
                    .tabItem {
                        Image(systemName: "heart")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
