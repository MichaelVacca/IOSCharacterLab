
import Foundation

final class StarWars: ObservableObject {
    private let characterService = StarWarsAccessService()
    @Published var charcaterDetails: CharcterDetailsInfo?
    @Published var searchText = ""
    
    
    var filteredcharacter: [StarWarsModel] {
        return searchText == "" ? characterList : characterList.filter {
            $0.name.contains(searchText)
        }
    }
    
    @Published var characterList = [StarWarsModel]()
    
    init() {
        fetchCharacter()
    }
    
    func fetchCharacter() {
        characterService.getCharacters() { characterList in
            DispatchQueue.main.async {
                self.characterList = characterList
            }
        }
    }
    
    func getCharacterId(character: StarWarsModel) -> Int {
        if let index = characterList.firstIndex(of: character) {
            return index + 1
        }
        return 0
    }
    
    
    func getDetails(character: StarWarsModel) {
        let id = getCharacterId(character: character)
        
        charcaterDetails = CharcterDetailsInfo(id: 0, name: "", species: "", gender: "", image: "")//, masters: [])

        characterService.getDetailedCharacter(id: id) { data in
            DispatchQueue.main.async {
                self.charcaterDetails = data
            }
        }
    }
    
}
   
