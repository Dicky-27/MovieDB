//
//  FavoriteForList.swift
//  MovieDB
//
//  Created by Dicky Buwono on 28/01/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteForList: View {
    @StateObject private var viewModel: ViewModel
    
    init(movie: Movie) {
        let viewModel = ViewModel(movie: movie)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        HStack (alignment: .top) {
            WebImage(url: URL(string: "\(Constant.BASE_IMAGE_URL)\(viewModel.movie.poster_path)"))
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width/2.1, height: UIScreen.main.bounds.height/7)
                .clipped()
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.movie.title)
                    .lineLimit(2)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Text(viewModel.movie.release_date)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(viewModel.genreMovie)
                    .lineLimit(2)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
            }.padding(.vertical)
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(.yellow)
                .padding(.vertical)
        }.frame(width: UIScreen.main.bounds.width/1.1)
    }
}

struct FavoriteForList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteForList(movie: Movie.preview)
    }
}
