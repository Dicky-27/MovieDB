//
//  HomeTabItem.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeTabItem: View {
    @ObservedObject private var viewModel = ViewModel.shared
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("MovieDB")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 50)
                .padding(.leading, 20)
                .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .leading)
                .background(Color.backgroundBar)
                .padding(.bottom, 10)
            ScrollView(showsIndicators: false) {
                bannerView()
                populerMovies()
                comingSoonMovies()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.backgroundColor)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    private func bannerView() -> some View {
        if viewModel.allMovies.isEmpty {
            ProgressView()
        }else {
            TabView {
                ForEach(viewModel.allMovies.prefix(10)) { item in
                    WebImage(url: URL(string: "\(Constant.BASE_IMAGE_URL)\(item.poster_path)"))
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: UIScreen.main.bounds.height/3)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
    
    @ViewBuilder
    private func populerMovies() -> some View {
        VStack(alignment: .leading) {
            Text("Populer Movies")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)
            ScrollView(.horizontal, showsIndicators: false) {
                if viewModel.populerMovies.isEmpty {
                    ProgressView()
                }else {
                    HStack {
                        ForEach(viewModel.populerMovies.prefix(10)) { item in
                            NavigationLink(destination: DetailView(movie: item)) {
                                WebImage(url: URL(string: "\(Constant.BASE_IMAGE_URL)\(item.poster_path)"))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 140)
                            }
                        }
                    }
                }
            }
        }.padding()
    }
    
    @ViewBuilder
    private func comingSoonMovies() -> some View {
        VStack(alignment: .leading) {
            Text("Coming Soon")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)
            ScrollView(.horizontal, showsIndicators: false) {
                if viewModel.comingSoonMovies.isEmpty {
                    ProgressView()
                }else {
                    HStack {
                        ForEach(viewModel.comingSoonMovies) { item in
                            NavigationLink(destination: DetailView(movie: item)) {
                                WebImage(url: URL(string: "\(Constant.BASE_IMAGE_URL)\(item.poster_path)"))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 140)
                            }
                        }
                    }
                }
            }
        }.padding()
    }
}

struct HomeTabItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabItem()
    }
}
