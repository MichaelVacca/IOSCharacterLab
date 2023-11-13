import Foundation

struct CharcterDetailsInfo: Codable {
    var id: Int
    var name: String
    var species: String
    var gender: String
    var image: String
 //   var masters: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, species, gender, image//, masters
    }
}

