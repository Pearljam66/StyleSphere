//
//  ClothingView.swift
//  StyleSphere
//
//  Created by Sarah Clark on 2/9/24.
//

import SwiftUI

struct ClothingView: View {
    @State private var searchText: String = ""
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 160, maximum: 200))]

    var body: some View {
        ScrollView {
            TextField("Search in Clothing", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)

            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(clothing) { clothing in
                    Button(action: {}) {
                        VStack(alignment: .leading) {
                            Image(clothing.imageName)
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)
                                .scaledToFill()
                                .cornerRadius(10)

                            Text(clothing.brand)
                                .lineLimit(1)
                            Text(clothing.description)
                                .lineLimit(1)
                            Text(clothing.color)
                                .lineLimit(1)
                        }
                        .hoverEffect()
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal, 24)
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                VStack (alignment: .leading) {
                    Text("Clothing")
                        .font(.largeTitle)
                    Text("100 pieces")
                        .foregroundStyle(.tertiary)
                }
                .padding(.all, 8)
            }
            ToolbarItem {
                Button {} label: {
                    Image(systemName: "line.3.horizontal.decrease")
                }
            }
        }
    }
}

#Preview {
    ClothingView()
}
