import SwiftUI

struct ThemeButtonView: View {
    @State var number: Int
    @State var image: String
    @Binding var theme: Int
    
    var body: some View {
        Button {
            theme = number
        } label: {
            VStack {
                Image(systemName: image)
                Text("Motyw " + String(number))
            }
        }
    }
}
