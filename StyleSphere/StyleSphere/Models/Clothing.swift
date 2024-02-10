//
//  Clothing.swift
//  StyleSphere
//
//  Created by Sarah Clark on 2/9/24.
//

import Foundation

struct Clothing: Identifiable {
    var id = UUID()
    var imageName: String
    var brand: String
    var description: String
    var color: String
}

let clothing: [Clothing] = [
    Clothing(imageName: "one", brand: "Free People", description: "Soul Song Long Sleeve Cotton Blend Top", color: "Dragonfruit Sorbet"),
    Clothing(imageName: "two", brand: "KUT from the Cloth", description: "Jasmine Chiffon Button-Up Shirt", color: "Chelles Bouquet Black Purple"),
    Clothing(imageName: "three", brand: "Nordstrom", description: "Moonlight Eco Short Pajamas", color: "Black"),
    Clothing(imageName: "four", brand: "Mother", description: "The Rider Mid Rise Ankle Jeans", color: "Local Charm")
]
