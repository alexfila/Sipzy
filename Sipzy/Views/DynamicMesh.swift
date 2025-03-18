import SwiftUI

struct DynamicMesh: View {
    
    @State private var colors: [Color] = [
        Color.pink, Color.blue, Color.yellow,
        Color.orange, Color.black, Color.purple,
        Color.cyan, Color.mint, Color.red
    ]
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    .init(0, 0), .init(0.5, 0), .init(1, 0),
                    .init(0, 0.5), .init(0.3, 0.5), .init(1, 0.5),
                    .init(0, 1), .init(0.5, 1), .init(1, 1)
                ],
                colors: colors
            )
        }
        .edgesIgnoringSafeArea(.all)
        .onReceive(timer) { _ in
                    withAnimation(.linear(duration: 16.5)) { // Faster transition for a playful effect
                        colors = colors.map { _ in
                            Color(hue: Double.random(in: 0...1),
                                  saturation: 2.5,
                                  brightness: 1.0)
                        }
                    }
                }
    }
}

#Preview { DynamicMesh().statusBarHidden() }
