//
//  SearchBar.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $text)
                    .foregroundColor(.white)
                    .onTapGesture {
                        self.isEditing = true
                    }
                if isEditing {
                    withAnimation(.default){
                        Button {
                            self.isEditing = false
                            self.text = ""
                        } label: {
                            Text("Cancel")
                                .foregroundColor(Color.accentColor)
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                    }
                }
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.accentColor)
            }
            Divider()
                .background(Color.white)
        }
        
        .frame(maxWidth: .infinity, maxHeight: 8, alignment: .leading)
        .padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
