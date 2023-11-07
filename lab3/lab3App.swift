import SwiftUI

@main
struct lab3App: App {
    @StateObject var viewModel = MemoGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
