import SwiftUI

struct FavouriteView: View {
    @Binding var favorites: [String: Bool]

    var body: some View {
        ZStack {
            DynamicMesh()
            VStack {
                Text("Favourite Clubs")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                let favoriteClubs = favorites.filter { $0.value }.map { $0.key }

                if favoriteClubs.isEmpty {
                    Text("No favourite club yet")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                } else {
                    VStack {
                        ForEach(favoriteClubs, id: \.self) { club in
                            HStack {
                                Text(club)
                                    .font(.title)
                                    .foregroundColor(.white)
                                Spacer()
                                Button(action: {
                                    favorites[club] = false
                                }) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 35)
                                            .stroke(Color.black.opacity(0.2), lineWidth: 2)
                                    )
                                    .shadow(color: Color.black.opacity(0.5), radius: 35, x: 0, y: 4)
                            )
                        }
                    }
                    .padding()
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

    return FavouriteView(favorites: $favorites)
}
