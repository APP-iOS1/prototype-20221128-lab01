//
//  SearchBar.swift
//  Cherry
//
//  Created by 전혜성 on 2022/11/30.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
     
        var body: some View {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.trailing, 5)
     
                    TextField("Search", text: $text)
                        .foregroundColor(.primary)
                        .textCase(.lowercase)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
     
                    if !text.isEmpty {
                        Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                        }
                    } else {
                        EmptyView()
                    }
                }
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
            }
            .padding(.horizontal)
        }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
