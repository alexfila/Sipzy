// ContentView.swift
// (c) Alex Fila 26/02/25

import SwiftUI

struct ContentView: View {
    @State private var favorites: [String: Bool] = [
            "Club1": false,
            "Club2": false,
            "Club3": false
        ]
    
    var body: some View {
        TabView {
            CupsView(favorites: $favorites)
                .tabItem { Image(systemName: "wineglass") }
            MapView().tabItem { Image(systemName: "map") }
            FavouriteView(favorites: $favorites)
                .tabItem { Image(systemName: "star") }
            ProfileView().tabItem { Image(systemName: "person.crop.circle") }
        }
        .accentColor(.white)
        .onAppear {
            let tabBarAppearance = UITabBar.appearance()
            tabBarAppearance.isTranslucent = true
            tabBarAppearance.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            tabBarAppearance.tintColor = .white
            tabBarAppearance.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.7)
        }
    }
}

#Preview { ContentView() }
