//
//  MoviesForGrid.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviesForGrid: View {
    @StateObject private var viewModel: ViewModel
    
    init(movie: Movie) {
        let viewModel = ViewModel(movie: movie)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                WebImage(url: URL(string: "\(Constant.BASE_IMAGE_URL)\(viewModel.movie.poster_path)"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.height/3)
                    .cornerRadius(8)
                    .clipped()
                Text(viewModel.genreMovie)
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(5)
                    .background(Color.yellow)
                    .cornerRadius(5)
                    .padding(7)
            }
            Text(viewModel.movie.title)
                .font(.system(size: 13, weight: .semibold))
                .lineLimit(1)
            Text("Release Date: \(viewModel.movie.release_date)")
                .font(.system(size: 10, weight: .regular))
                .lineLimit(1)
                .foregroundColor(.gray)
        }
        .frame(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.height/2.6)
    }
}

struct MoviesForGrid_Previews: PreviewProvider {
    static var previews: some View {
        MoviesForGrid(movie: Movie.preview)
    }
}
