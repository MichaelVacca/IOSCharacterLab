

//

import SwiftUI



struct CharacterDetailvIEW: View {
    
    @EnvironmentObject var viewModel: StarWars
    let character: StarWarsModel
    
    var body: some View {
        Label("Character  Info", systemImage: "info.square")
                   .labelStyle(IconLabelStyle())
                   .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                   .fontWeight(.heavy)
        
        VStack {
            CharacterView(character: character)
            
            VStack(spacing: 10) {
                Text("**ID**: \(viewModel.charcaterDetails?.id ?? 0)")
                    .customContentView()
                Text("**Status**: \(viewModel.charcaterDetails?.status ?? "")")
                    .customContentView()
                Text("**Species**: \(viewModel.charcaterDetails?.species ?? "")")
                    .customContentView()
                Text("**Type**: \(viewModel.charcaterDetails?.type ?? "")")
                    .customContentView()
                Text("**Gender**: \(viewModel.charcaterDetails?.gender ?? "")")
                    .customContentView()
                
               
            }
            
            
        }
        .onAppear(){
            viewModel.getDetails(character: character)
        }
    }
}

struct CharacterDetailvIEW_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailvIEW(character: StarWarsModel.sampleCharacter)
            .environmentObject(StarWars())
    }
}
