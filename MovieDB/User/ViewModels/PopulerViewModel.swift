//
//  PopulerViewModel.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import Foundation

extension PopulerTabItem {
    class ViewModel: ObservableObject {
        static let shared = ViewModel()
        @Published var populerMovies = [Movie]()
        
        init() {
            getPopulerMovies()
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
    }
}
