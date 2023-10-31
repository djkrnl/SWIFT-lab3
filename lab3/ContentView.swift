import SwiftUI

struct ContentView: View {
    @State var theme = 1
    let off = 2

    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            ScrollView {
                cardDisplay
            }
            
            themeButtons
        }
        .foregroundColor(theme == 1 ? .blue : (theme == 2 ? .red : .green))
        .padding()
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach (0 ..< themeContents().1, id: \.self) { index in
                CardView(faceUp: false, content: themeContents().0[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var themeButtons: some View {
        return themeButtonsViews()
    }
    
    func themeButtonsViews() -> some View {
        HStack {
            ThemeButtonView(number: 1, image: "note", theme: $theme)
            Spacer()
            ThemeButtonView(number: 2, image: "heart", theme: $theme)
            Spacer()
            ThemeButtonView(number: 3, image: "doc", theme: $theme)
        }
    }
    
    func themeContents() -> (Array<String>, Int) {
        if (theme == 1) {
            return (["😁", "😁", "🥰", "🥰", "💩", "💩", "😰", "😰", "🤬", "🤬"].shuffled(), 10)
        } else if (theme == 2) {
            return (["😢", "😢", "💀", "💀", "🤯", "🤯"].shuffled(), 6)
        } else {
            return (["😇", "😇", "🥹", "🥹", "🥶", "🥶", "🤐", "🤐"].shuffled(), 8)
        }
    }
}
