//
//  HomeViewModel.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI

extension HomeTabItem {
    class ViewModel: ObservableObject {
        static let shared = ViewModel()
        @Published var comingSoonMovies = [Movie]()
        @Published var populerMovies = [Movie]()
        @Published var allMovies = [Movie]()
        
        init() {
            getAllMovies()
            getPopulerMovies()
            getComingSoonMovies()
        }
        
        func getAllMovies() {
            NetworkManager.loadData(url: Constant.GET_MOVIES_LIST) { response in
                switch response {
                case .success(let movies) :
                    DispatchQueue.main.async {
                        self.allMovies = movies.results
                    }
                case .failure(let err):
                    print(err)
                }
            }
        }
        
        func getPopulerMovies() {
            NetworkManager.loadData(url: Constant.GET_POPULER_LIST) { response in
                switch response {
                case .success(let movies) :
                    DispatchQueue.main.async {
                        self.populerMovies = movies.results
                    }
                case .failure(let err):
                    print(err)
                }
            }
        }
        
        func getComingSoonMovies() {
            let year = Calendar.current.component(.year, from: Date())
            let nextYear = Calendar.current.component(.year, from: Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date())
            NetworkManager.loadData(url: Constant.GET_MOVIES_LIST) { response in
                switch response {
                case .success(let movies) :
                    DispatchQueue.main.async {
                        self.comingSoonMovies = movies.results.filter { $0.release_date.contains("\(year)") || $0.release_date.contains("\(String(describing: nextYear))")}
                    }
                case .failure(let err):
                    print(err)
                }
            }
        }
    }
}
