

import SwiftUI

struct CharacterView: View {
    @EnvironmentObject var viewModel: StarWars
    let character: StarWarsModel
    let dimensions: Double = 140
    
    //https://akabab.github.io/starwars-api/api/all.json
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://rickandmortyapi.com/api/character/avatar//\(viewModel.getCharacterId(character: character)).jpeg")) { image in
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
            
            Text("\(character.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
                 .customContentView()
        }
        
    }
}
