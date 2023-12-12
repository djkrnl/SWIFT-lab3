import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    
    init(_ card: MemoGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        CirclePart(endAngle: .degrees(240))
            .opacity(0.5)
            .overlay(
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.05)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
                    .rotationEffect(.degrees(card.matched ? 360 : 0))
                    .animation(.spin(duration: 2), value: card.matched)
            )
            .padding(5)
            .transformIntoCard(faceUp: card.faceUp)
            .opacity(card.faceUp || !card.matched ? 1 : 0)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
}
