// ContentView.swift
// (c) Alex Fila 26/02/25

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CupsView().tabItem { Image(systemName: "wineglass") }
            MapView().tabItem { Image(systemName: "map") }
            FavouriteView().tabItem { Image(systemName: "star") }
            ProfileView().tabItem { Image(systemName: "person.crop.circle") }
        }
        .accentColor(.white) // This will change the color of the selected tab bar item to white
        .onAppear {
            let tabBarAppearance = UITabBar.appearance()
            tabBarAppearance.isTranslucent = true
            tabBarAppearance.backgroundColor = UIColor.black.withAlphaComponent(0.4) // Semi-transparent black
            tabBarAppearance.tintColor = .white // Ensure the active tab item is white
            tabBarAppearance.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.7) // Slightly dimmed unselected items
        }
    }
}

#Preview { ContentView() }
