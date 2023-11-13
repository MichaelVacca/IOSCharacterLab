//
//  StarWarsAccessService.swift
//  IOSCharacterLab
//
//  Created by macuser on 2023-11-08.
//

import Foundation

class StarWarsAccessService{
    func getCharacters(completion: @escaping ([StarWarsModel]) -> ()) {
        let url = "https://akabab.github.io/starwars-api/api/all.json"
        Bundle.main.fetchData(url: url, model: [StarWarsModel].self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getDetailedCharacter(id: Int, _ completion:@escaping (CharcterDetailsInfo) -> () ) {
        Bundle.main.fetchData(url:  "https://akabab.github.io/starwars-api/api/id/\(id).json"
                              
                              ,model: CharcterDetailsInfo.self) {
            data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
}
