//
//  StyleSphereApp.swift
//  StyleSphere
//
//  Created by Sarah Clark on 2/9/24.
//

import SwiftUI

@main
struct StyleSphereApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
