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
    
    private var gridItemLayout = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        VStack {
            SearchBar(text: $searchtext)
                .padding(.top, 50)
                .padding(.horizontal, 20)
                .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .leading)
                .background(Color.backgroundBar)
                .padding(.bottom, 10)
            ScrollView {
                VStack(alignment: .leading) {
                    if searchtext != "" {
                        HStack {
                            Text("Showing result of")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(Color.white)
                            Text("'\(searchtext)'")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                        }.padding(.horizontal)
                        
                    }
                    moviesGrid()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.backgroundColor)
        .navigationTitle("")
        .navigationBarHidden(true)
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
        PopulerTabItem()
    }
}
