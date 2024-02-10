//
//  SideMenu.swift
//  StyleSphere
//
//  Created by Sarah Clark on 2/9/24.
//

import Foundation

struct SideMenuItem: Identifiable, Hashable {
    var id = UUID()
    var category: String
    var icon: String
}

let sideMenuItems: [SideMenuItem] = [
    SideMenuItem(category: "Clothing", icon: "tshirt"),
    SideMenuItem(category: "Shoes", icon: "shoe"),
    SideMenuItem(category: "Handbags", icon: "handbag.fill"),
    SideMenuItem(category: "Jewelry", icon: "sparkles")
]
