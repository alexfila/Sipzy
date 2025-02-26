// 4ProfileView.swift
// (c) Alex Fila 26/02/25

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            DynamicMesh()
            Text("Profile Settings")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
    }
}

#Preview { ProfileView() }
