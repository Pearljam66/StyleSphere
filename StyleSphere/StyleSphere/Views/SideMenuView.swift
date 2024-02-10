//
//  SideMenuView.swift
//  StyleSphere
//
//  Created by Sarah Clark on 2/9/24.
//

import SwiftUI

struct SideMenuView: View {
    @State private var selectedMenu: SideMenuItem? = sideMenuItems.first!

    var body: some View {
        List(sideMenuItems) { item in
            NavigationLink(value: item) {
                Label(item.category, systemImage: item.icon)
                    .foregroundStyle(.primary)
            }
        }
        .navigationDestination(for: SideMenuItem.self) { item in

        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                VStack(alignment: .leading) {
                    Text("StyleSphere")
                        .font(.largeTitle)
                    Text("All Categories")
                        .foregroundStyle(.tertiary)
                }
                .padding(.all, 8)
            }
            ToolbarItem {
                Button {} label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }
}

#Preview {
    SideMenuView()
}
