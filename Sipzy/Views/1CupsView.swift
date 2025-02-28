// 1CupsView.swift
// (c) Alex Fila 26/02/25

import SwiftUI

struct CupsView: View {
    var body: some View {
        ZStack {
            DynamicMesh()
            Text("List of clubs")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
    }
}

#Preview { CupsView() }
