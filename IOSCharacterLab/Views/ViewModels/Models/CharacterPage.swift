import Foundation

struct Info: Codable {
    let count: Int
    let next: String
}

struct CharcaterPage: Codable {
    let info: Info
    let results: [StarWarsModel]
}
