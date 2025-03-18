import SwiftUI

struct CupsView: View {
    @Binding var favorites: [String: Bool]
    
    var body: some View {
        NavigationStack {
        ZStack {
            DynamicMesh()
            ScrollView {
                VStack {
                    ForEach(Array(favorites.keys.sorted().enumerated()), id: \.element) { index, club in
                        if let clubDetails = clubs.first(where: { $0.name == club }) {
                            NavigationLink(destination: ClubDetailView(club: clubDetails)) {
                                HStack {
                                    Image(club)
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text(club)
                                        .lineLimit(2)
                                        .truncationMode(.tail)
                                        .font(.title)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    Button(action: { favorites[club]?.toggle() }) {
                                        Image(systemName: favorites[club] == true ? "star.fill" : "star")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.yellow)
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 35)
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 35)
                                                .stroke(Color.black.opacity(0.4), lineWidth: 2)
                                        )
                                        .shadow(color: Color.black.opacity(0.7), radius: 35, x: 0, y: 4)
                                )
                            }
                        }
                    }
                }
                .padding()
            }
            .padding(.bottom, 0.5)
        }
        }
    }
}

struct ClubDetailView: View {
    let club: Contact
    
    var body: some View {
        ZStack {
            DynamicMesh()
            VStack(alignment: .leading, spacing: 20) {
                Text(club.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                TabView {
                    ForEach(0..<3, id: \.self) { index in
                        let imageName = index == 0 ? club.name : "\(club.name)\(index + 1)"
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 10)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 320)
                
                Text("📍 Address: \(club.address)")
                    .foregroundColor(.white)
                    .font(.title2)
                
                Text("📞 Phone: \(club.phoneNumber)")
                    .foregroundColor(.white)
                    .font(.title2)
                
                if let url = club.link {
                    Link("🌐 Visit Website", destination: url)
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 35)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay(
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(Color.black.opacity(0.2), lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.5), radius: 35, x: 0, y: 4)
            )
            .padding()
        }
    }
}

#Preview("Clubs") {
    @State var favorites = [
        "Club1": true,
        "Club2": false,
        "Club3": true]
    return CupsView(favorites: $favorites)}

#Preview("Content") { ContentView() }
