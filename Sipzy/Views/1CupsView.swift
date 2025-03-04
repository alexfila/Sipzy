import SwiftUI

struct CupsView: View {
    @Binding var favorites: [String: Bool]

    var subtitles: [String] = ["Subtitle 1", "Subtitle 2", "Subtitle 3"]

    var body: some View {
        ZStack {
            DynamicMesh()
            VStack {
                ForEach(Array(favorites.keys.sorted().enumerated()), id: \.element) { index, club in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(club)
                                .font(.title)
                                .foregroundColor(.white)
                            if index < subtitles.count {
                                Text(subtitles[index])
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        Button(action: {
                            favorites[club]?.toggle()
                        }) {
                            Image(systemName: favorites[club] == true ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 35)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .overlay(
                                RoundedRectangle(cornerRadius: 35)
                                    .stroke(Color.white.opacity(0.6), lineWidth: 2)
                            )
                            .shadow(color: Color.black.opacity(0.3), radius: 35, x: 0, y: 4)
                    )
                }
            }
            .padding()
        }
    }
}

#Preview {
    @State var favorites = [
        "Club1": true,
        "Club2": false,
        "Club3": true
    ]

    return CupsView(favorites: $favorites)
}
