import SwiftUI

struct ThemeButtonView: View {
    @State var number: Int
    @State var image: String
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        Button {
            viewModel.theme(theme: number)
        } label: {
            VStack {
                Image(systemName: image)
                Text("Motyw " + String(number))
            }
        }
    }
}
