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
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(.systemGray3))
            TextField("Search...", text: $text)
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
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 8, alignment: .leading)
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).fill(Color(.systemGray6)))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
