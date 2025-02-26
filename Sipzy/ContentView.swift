// ContentView.swift
// (c) Alex Fila 26/02/25

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CupsView()
                .tabItem {
                    Image(systemName: "wineglass")
                        .font(.system(size: 35)) // Larger icon
                        .foregroundColor(.white) // Ensure icon is really white
                        .shadow(color: .black, radius: 15, x: 0, y: 15) // Add shadow effect
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 15, x: 0, y: 15) // Add shadow effect
                }
            
            FavouriteView()
                .tabItem {
                    Image(systemName: "star")
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 15, x: 0, y: 15) // Add shadow effect
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 15, x: 0, y: 15) // Add shadow effect
                }
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
