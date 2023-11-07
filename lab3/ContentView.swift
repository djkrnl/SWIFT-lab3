import SwiftUI

struct ContentView: View {
    @State var theme = 1
    @ObservedObject var viewModel: MemoGameViewModel = MemoGameViewModel()

    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            ScrollView {
                cardDisplay
            }
            
            Button("🔀") {
                viewModel.shuffle()
            }
            .padding()
            
            themeButtons
        }
        .foregroundColor(theme == 1 ? .blue : (theme == 2 ? .red : .green))
        .padding()
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))], spacing: 10) {
            ForEach (viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var themeButtons: some View {
        return themeButtonsViews()
    }
    
    func themeButtonsViews() -> some View {
        HStack {
            ThemeButtonView(number: 1, image: "note", theme: $theme, viewModel: viewModel)
            Spacer()
            ThemeButtonView(number: 2, image: "heart", theme: $theme, viewModel: viewModel)
            Spacer()
            ThemeButtonView(number: 3, image: "doc", theme: $theme, viewModel: viewModel)
        }
    }
}
