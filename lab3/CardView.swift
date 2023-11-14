import SwiftUI

struct CardView: View {
    @State var card: MemoGameModel<String>.Card
    
    init(_ card: MemoGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(card.faceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: 12)
                .fill()
                .opacity(card.faceUp ? 0 : 1)
        }
        .opacity(card.faceUp || !card.matched ? 1 : 0)
    }
}
