import SwiftUI

struct ContentView: View {
    let contents: Array<String> = ["a", "b", "c", "d"]

    var body: some View {
        HStack {
            ForEach (contents.indices, id: \.self) { index in
                CardView(faceUp: false, content: contents[index])
            }
        }
        .foregroundColor(.blue)
        .padding()
    }
}
