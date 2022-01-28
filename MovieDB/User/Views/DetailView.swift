//
//  DetailView.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreData

struct DetailView: View {
    @StateObject private var viewModel: ViewModel
    @State var isFavorite = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: true)]
    ) var item: FetchedResults<Item>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "arrow.backward")
                .font(.system(size: 25))
                .foregroundColor(.yellow)
        }
    }
    }
    
    init(movie: Movie) {
        let viewModel = ViewModel(movie: movie)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ZStack(alignment: .topLeading) {
                    ZStack(alignment: .bottom) {
                        WebImage(url: URL(string: "\(Constant.BASE_IMAGE_URL)\(viewModel.movie.poster_path)"))
                            .resizable()
                            .overlay(Color.black.opacity(0.4))
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                            .clipped()
                        VStack(alignment: .leading, spacing: 10) {
                            Text(viewModel.movie.title)
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .bold))
                                .padding(.horizontal)
                            Text(viewModel.genreMovie)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .padding(.horizontal)
                            HStack {
                                Button {
                                    
                                }label: {
                                    HStack {
                                        Image(systemName: "play")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .semibold))
                                        Text("Watch Trailer")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .semibold))
                                    }
                                    .padding(10)
                                    .padding(.horizontal, 10)
                                    .background(Color.yellow)
                                    .cornerRadius(7)
                                }
                                Spacer()
                                Button {
                                    if isFavorite {
                                        PersistenceController.shared.delete(withID: Int64(viewModel.movie.id))
                                        isFavorite = checkIfItemExist(id: Int64(viewModel.movie.id))
                                    }else {
                                        let item = Item(context: managedObjectContext)
                                        item.id = Int64(viewModel.movie.id)
                                        PersistenceController.shared.save()
                                        isFavorite = checkIfItemExist(id: Int64(viewModel.movie.id))
                                    }
                                }label: {
                                    HStack {
                                        Image(systemName: isFavorite ?  "minus" : "plus")
                                            .foregroundColor(.yellow)
                                            .font(.system(size: 13, weight: .semibold))
                                        Text(isFavorite ? "Remove from Favorite" : "Add to Favorite")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .semibold))
                                    }
                                    .padding(10)
                                    .padding(.horizontal, 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7)
                                            .stroke(Color.yellow, lineWidth: 1)
                                    )
                                }
                            }.padding(.horizontal)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .padding()
                    }
                    btnBack
                        .padding(.top, 50)
                        .padding(.leading, 40)
                }
                Text(viewModel.movie.overview)
                    .padding(.horizontal, 30)
                    .foregroundColor(.white)
                
                Text("Release Date :")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, 30)
                    .padding(.top)
        
                Text(viewModel.movie.release_date)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.leading, 30)
                Spacer()
            }
            .padding(.horizontal)
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.backgroundColor)
        .onAppear {
            isFavorite = checkIfItemExist(id: Int64(viewModel.movie.id))
        }
    }
    
    private func checkIfItemExist(id: Int64) -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Item")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "id == %d" ,id)
        
        do {
            let count = try managedObjectContext.count(for: fetchRequest)
            if count > 0 {
                return true
            }else {
                return false
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie.preview)
    }
}
