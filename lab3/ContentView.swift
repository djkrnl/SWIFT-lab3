import SwiftUI

struct ContentView: View {
    let contents: Array<String> = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    @State var cardCount = 4
    let off = 2

    var body: some View {
        HStack {
            ForEach (0 ..< cardCount, id: \.self) { index in
                CardView(faceUp: false, content: contents[index])
            }
        }
        .foregroundColor(.blue)
        .padding()
        
        HStack {
            addCard
            Spacer()
            removeCard
        }
        .padding()
    }
    
    var addCard: some View {
        return adjustCardNumber(offset: off, symbol: "+")
            //.isEnabled(cardCount + off <= contents.count ? true : false)
    }
    
    var removeCard: some View {
        return adjustCardNumber(offset: off, symbol: "-")
            //.isEnabled(cardCount - off >= 0 ? true : false)
    }
    
    func adjustCardNumber(offset: Int, symbol: String) -> some View {
        Button(symbol) {
            if (symbol == "+") {
                cardCount = cardCount + offset
            }
            else if (symbol == "-") {
                cardCount = cardCount - offset
            }
        }
        .disabled(symbol == "+" ? (cardCount + off > contents.count ? true : false) : (cardCount - off <= 0 ? true : false))
    }
}
