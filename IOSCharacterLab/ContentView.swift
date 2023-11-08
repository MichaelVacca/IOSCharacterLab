

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = StarWars()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(viewModel.filteredcharacter) { character in
                        NavigationLink(destination: CharacterDetailvIEW(character: character)) {
                            CharacterView(character: character)
                        }
                        
                    }
                }
                .animation(.easeIn(duration: 0.3), value: viewModel.filteredcharacter.count)
                .navigationTitle("Abdurs Character Dex")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $viewModel.searchText)
         
        }
        .environmentObject(viewModel)
      
       
      
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

