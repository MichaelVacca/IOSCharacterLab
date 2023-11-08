
import SwiftUI
struct CustomContentView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.red)
            .font(.title3)
            .cornerRadius(10)
    }
}

extension View {
    func customContentView() -> some View {
        self.modifier(CustomContentView())
    }
}
