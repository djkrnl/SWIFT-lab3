import Foundation

struct MemoGameModel<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pair in 0 ..< max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pair)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var faceUp = false
        var matched = false
        var content: CardContent
    }
}
