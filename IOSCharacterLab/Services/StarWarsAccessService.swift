//
//  StarWarsAccessService.swift
//  IOSCharacterLab
//
//  Created by macuser on 2023-11-08.
//

import Foundation

class RickAndMortyAcessService {
    func getCharacters( completion:@escaping ([StarWarsModel]) -> ()){
        Bundle.main.fetchData(url: "https://rickandmortyapi.com/api/character", model: CharcaterPage.self) {
            data in
            completion(data.results)
        } failure: { error in
            print(error)
        }
    }
    
    func getDetailedCharacter(id: Int, _ completion:@escaping (CharcterDetailsInfo) -> () ) {
        Bundle.main.fetchData(url:  "https://rickandmortyapi.com/api/character/\(id)/"
                              
                              ,model: CharcterDetailsInfo.self) {
            data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
