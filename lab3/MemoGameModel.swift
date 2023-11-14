import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pair in 0 ..< max(2, numberOfPairsOfCards) {
            let cardContent = cardContentFactory(pair)
            cards.append(Card(content: cardContent, id: "\(pair + 1)a"))
            cards.append(Card(content: cardContent, id: "\(pair + 1)b"))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func choose(card: Card) {
        
    }
    
    struct Card: Equatable, Identifiable {
        /*static func == (lhs: MemoGameModel<CardContent>.Card, rhs: MemoGameModel<CardContent>.Card) -> Bool {
            return lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched && lhs.content == rhs.content
        }*/
    
        var faceUp = false
        var matched = false
        var content: CardContent
        var id: String
    }
}
