import Foundation

struct StarWarsModel: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys:  String, CodingKey {
        case name
        case url
    }
    
    //https://akabab.github.io/starwars-api/api/all.json
    static var sampleCharacter = StarWarsModel(name: "Rick Sanchez", url: "https://rickandmortyapi.com/api/character/1")
    
}
