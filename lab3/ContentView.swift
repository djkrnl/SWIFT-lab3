import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(faceUp: false)
            CardView(faceUp: false)
            CardView(faceUp: false)
            CardView(faceUp: false)
        }
        .foregroundColor(.blue)
        .padding()
    }
}

#Preview {
    ContentView()
}
