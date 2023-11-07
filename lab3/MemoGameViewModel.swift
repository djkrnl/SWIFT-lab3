import SwiftUI

class MemoGameViewModel: ObservableObject {
    static var content1 = ["😁", "🥰", "💩", "😰", "🤬"]
    static var content2 = ["😢", "💀", "🤯"]
    static var content3 = ["😇", "🥹", "🥶", "🤐"]
    public static var content = content1
    
    static func createModel() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfPairsOfCards: content.count) { index in
            if (content.indices.contains(index)) {
                return content[index]
            } else {
                return "?"
            }
        }
    }
    
    @Published var model = createModel()
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(card: MemoGameModel<String>.Card) {
        model.choose(card: card)
    }
    
    func theme(theme: Int) {
        if (theme == 1) {
            MemoGameViewModel.content = MemoGameViewModel.content1
        } else if (theme == 2) {
            MemoGameViewModel.content = MemoGameViewModel.content2
        } else {
            MemoGameViewModel.content = MemoGameViewModel.content3
        }
        
        model = MemoGameViewModel.createModel()
    }
}
