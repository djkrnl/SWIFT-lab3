import SwiftUI

struct ThemeButtonView: View {
    @State var number: Int
    @State var image: String
    
    var body: some View {
        Button {
            
        } label: {
            VStack {
                Image(systemName: image)
                Text("Motyw " + String(number))
            }
        }
    }
}
