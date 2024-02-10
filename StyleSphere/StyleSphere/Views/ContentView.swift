//
//  ContentView.swift
//  StyleSphere
//
//  Created by Sarah Clark on 2/9/24.
//

import RealityKit
import RealityKitContent
import SwiftUI
import UIKit

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        NavigationSplitView {
            SideMenuView()
        } detail: {
            ClothingView()
        }.tabItem {
            Label("Blah", systemImage: "music.note")
        }

                .navigationTitle("StyleSphere")
                .foregroundStyle(.white)


                //Model3D(named: "Scene", bundle: realityKitContentBundle)
                    //.padding(.bottom, 50)

                //Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                    //.toggleStyle(.button)
                    //.padding(.top, 50)

            .navigationBarColor(.systemIndigo)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }

    func navigationLink<Destination: View>(destination: Destination, label: String, systemImage: String) -> some View {
        NavigationLink(destination: destination) {
            Label(label, systemImage: systemImage)
        }
        .listRowSeparator(.hidden)
    }
}

extension View {
    func navigationBarColor(_ color: UIColor) -> some View {
        self.modifier(NavigationBarColorModifier(color: color))
    }
}

struct NavigationBarColorModifier: ViewModifier {
    var color: UIColor

    func body(content: Content) -> some View {
        content
            .onAppear {
                let coloredAppearance = UINavigationBarAppearance()
                coloredAppearance.configureWithOpaqueBackground()
                coloredAppearance.titleTextAttributes = [.foregroundColor: color]
                coloredAppearance.largeTitleTextAttributes = [.foregroundColor: color]

                UINavigationBar.appearance().standardAppearance = coloredAppearance
                UINavigationBar.appearance().compactAppearance = coloredAppearance
                UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
            }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
