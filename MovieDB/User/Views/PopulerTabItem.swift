//
//  PopulerTabItem.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI

struct PopulerTabItem: View {
    
    @State private var searchtext = ""
    @ObservedObject private var viewModel = ViewModel.shared
    @Binding var navBarTitle: String
    
    private var gridItemLayout = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    init(navBarTitle: Binding<String>) {
        self._navBarTitle = navBarTitle
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                SearchBar(text: $searchtext)
                    .padding()
                if searchtext != "" {
                    HStack {
                        Text("Showing result of")
                            .font(.system(size: 17, weight: .regular))
                        Text("'\(searchtext)'")
                            .font(.system(size: 15, weight: .bold))
                    }.padding(.horizontal)
                    
                }
                moviesGrid()
            }
        }.onAppear {
            navBarTitle = "Popular"
        }
    }
    
    @ViewBuilder
    private func moviesGrid() -> some View {
        LazyVGrid(columns: gridItemLayout) {
            ForEach(viewModel.populerMovies.filter({searchtext.isEmpty ? true : $0.title.contains(searchtext)})) { movie in
                NavigationLink(destination: DetailView(movie: movie)) {
                    MoviesForGrid(movie: movie)
                }
            }
        }.padding(.horizontal)
    }
    
}

struct PopulerTabItem_Previews: PreviewProvider {
    static var previews: some View {
        PopulerTabItem(navBarTitle: .constant("Populer"))
    }
}
