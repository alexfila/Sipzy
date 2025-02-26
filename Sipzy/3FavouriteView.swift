// 3FavouriteView.swift
// (c) Alex Fila 26/02/25

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        ZStack {
            DynamicMesh()
            Text("Favourite Clubs")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
    }
}

#Preview { FavouriteView() }
