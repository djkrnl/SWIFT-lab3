import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score: Int
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        score = 0
        for pair in 0 ..< max(2, numberOfPairsOfCards) {
            let cardContent = cardContentFactory(pair)
            cards.append(Card(content: cardContent, id: "\(pair + 1)a"))
            cards.append(Card(content: cardContent, id: "\(pair + 1)b"))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCards = cards.indices.filter { index in
                cards[index].faceUp
            }
            return faceUpCards.count == 1 ? faceUpCards.first : nil
        }
        set {
            return cards.indices.forEach {
                cards[$0].faceUp = (newValue == $0)
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if (!cards[chosenIndex].faceUp && !cards[chosenIndex].matched) {
                if let potentialIndex = indexOfOneAndOnlyFaceUpCard {
                    if (cards[chosenIndex].content == cards[potentialIndex].content) {
                        cards[chosenIndex].matched = true
                        cards[potentialIndex].matched = true
                        
                        score += 4
                    } else {
                        if (cards[chosenIndex].hasBeenSeen) {
                            score -= 1
                        }
                        if (cards[potentialIndex].hasBeenSeen) {
                            score -= 1
                        }
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].faceUp = true
            }
        }
    }
    
    struct Card: Equatable, Identifiable {
        /*static func == (lhs: MemoGameModel<CardContent>.Card, rhs: MemoGameModel<CardContent>.Card) -> Bool {
            return lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched && lhs.content == rhs.content
        }*/
    
        var faceUp = false {
            didSet {
                if oldValue && !faceUp {
                    hasBeenSeen = true
                }
            }
        }
        var hasBeenSeen = false
        var matched = false
        var content: CardContent
        var id: String
    }
}
