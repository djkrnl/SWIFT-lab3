import SwiftUI

struct CardView: View {
    @State var faceUp: Bool = false
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text("👌")
                    .font(.largeTitle)
            }
            .opacity(faceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: 12)
                .fill()
                .opacity(faceUp ? 0 : 1)
        }
        .onTapGesture (perform: {
            faceUp.toggle()
        })
    }
}

#Preview {
    CardView()
}
