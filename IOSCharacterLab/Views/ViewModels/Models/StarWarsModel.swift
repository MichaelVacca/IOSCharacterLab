import Foundation

struct StarWarsModel: Codable, Identifiable, Equatable {
    var id: Int
    var name: String
    var species: String
    var gender: String
    var image: String
    //var masters: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, species, gender, image//, image, masters
    }

    // Sample for testing
    static let sampleCharacter = StarWarsModel(id: 1, name: "Luke Skywalker", species: "human", gender: "male", image: "https://example.com/image.jpg")//, masters: ["Obi-Wan Kenobi", "Yoda"])
}

