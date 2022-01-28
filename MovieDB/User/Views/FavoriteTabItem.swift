//
//  FavoriteTabItem.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI

struct FavoriteTabItem: View {
    @State var allMovies = [Movie]()
    @State var filtered = [Movie]()
    @State var searchText = ""
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: true)]
    )var items: FetchedResults<Item>
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            .padding(.top, 50)
            .padding(.horizontal, 20)
            .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .leading)
            .background(Color.backgroundBar)
            .padding(.bottom, 10)
            ScrollView {
                if searchText != "" {
                    HStack {
                        Text("Showing result of")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color.white)
                        Text("'\(searchText)'")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(Color.white)
                    }.padding(.horizontal)
                }
                ForEach(filtered.filter({searchText.isEmpty ? true : $0.title.contains(searchText)}), id: \.id) { item in
                    NavigationLink(destination: DetailView(movie: item)) {
                        FavoriteForList(movie: item)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.backgroundColor)
        .navigationTitle("")
        .navigationBarHidden(true)
        .onAppear {
            loadData()
        }
    }
    
    private func loadData() {
        NetworkManager.loadData(url: Constant.GET_MOVIES_LIST) { response in
            switch response {
            case .success(let movies):
                DispatchQueue.main.async {
                    allMovies = movies.results
                    filterData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func filterData() {
        var id: [Int] = []
        for item in items {
            id.append(Int(item.id))
        }
        filtered = allMovies.filter {
            id.contains($0.id)
        }
    }
}

struct FavoriteTabItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTabItem()
    }
}
