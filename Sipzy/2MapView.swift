// 2MapView.swift
// (c) Alex Fila 26/02/25

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack {
            DynamicMesh()
            Text("Map of the city")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
    }
}

#Preview { MapView() }
