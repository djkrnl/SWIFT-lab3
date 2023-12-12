import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel = MemoGameViewModel()
    @State var lastScoreChange = (0, causedByCardId: "")

    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            ScrollView {
                cardDisplay
                    .foregroundColor(MemoGameViewModel.color)
            }
            
            HStack {
                score
                
                Spacer()
                
                shuffle
            }
                .font(.largeTitle)
                .padding()
            
            themeButtons
        }
        // .foregroundColor(MemoGameViewModel.color)
        .padding()
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))], spacing: 10) {
            ForEach (viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .zIndex(scoreChange(causedBy: card) != 0 ? 100 : 0)
                    .onTapGesture {
                        withAnimation {
                            let scoreBeforeChoose = viewModel.score
                        
                            viewModel.choose(card)
                            
                            let scoreChange = viewModel.score - scoreBeforeChoose
                            lastScoreChange = (scoreChange, causedByCardId: card.id)
                        }
                    }
            }
        }
    }
    
    private func scoreChange(causedBy card: MemoGameModel<String>.Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
    
    var score: some View {
        Text("Wynik: \(viewModel.score)")
            .animation(nil)
    }
    
    var shuffle: some View {
        Button("🔀") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    var themeButtons: some View {
        return themeButtonsViews()
    }
    
    func themeButtonsViews() -> some View {
        HStack {
            ThemeButtonView(number: 1, image: "note", viewModel: viewModel)
            Spacer()
            ThemeButtonView(number: 2, image: "heart", viewModel: viewModel)
            Spacer()
            ThemeButtonView(number: 3, image: "doc", viewModel: viewModel)
        }
    }
}
