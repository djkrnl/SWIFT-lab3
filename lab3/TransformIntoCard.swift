import SwiftUI

struct TransformIntoCard: ViewModifier, Animatable {
    init(faceUp: Bool) {
        rotation = faceUp ? 0 : 180
    }

    var faceUp: Bool {
        rotation < 90
    }
    
    var rotation: Double
    
    var animatableData: Double {
        get {
            rotation
        }
        set {
            rotation = newValue
        }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base.strokeBorder(lineWidth: 2)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(faceUp ? 1 : 0)
            base.fill()
                .opacity(faceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0, 1, 0))
    }
}

extension View {
    func transformIntoCard(faceUp: Bool) -> some View {
        modifier(TransformIntoCard(faceUp: faceUp))
    }
}
