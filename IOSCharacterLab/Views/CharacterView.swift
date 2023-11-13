import SwiftUI

struct CharacterView: View {
    let character: StarWarsModel
    let dimensions: Double = 140

    var body: some View {
        VStack {
            if let imageUrl = URL(string: character.image) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                } placeholder: {
                    ProgressView()
                        .frame(width: dimensions, height: dimensions)
                }
                .background(.thinMaterial)
                .clipShape(Circle())
            }

            Text("\(character.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
                
        }
    }
}
