//
//  Helpers.swift
//  IOSCharacterLab
//
//  Created by macuser on 2023-11-08.
//

import Foundation

extension Bundle {
    
    func decode<T:Decodable>(file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not load \(file) from bundle.")
            
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not extract data from \(file).")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
    
    func fetchData<T: Decodable>(url: String, model: T.Type, completion:@escaping(T)
                                     -> (), failure:@escaping(Error) -> ()) {
            guard let url = URL(string: url) else {return}

            print("URL for request: \(url)")

            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP Response Status code: \(httpResponse.statusCode)")
                }
                
                guard let data = data else {
                    if let error = error {
                        print("Error fetching data: \(error.localizedDescription)")
                        failure(error)
                    }
                    return
                }

                do {
                    print("Data received: \(data.count) bytes")
                    let serverData = try JSONDecoder().decode(T.self, from: data)
                    completion(serverData)
                } catch {
                    print("JSON Decoding Error: \(error.localizedDescription)")
                    failure(error)
                }
            }
            .resume()
        }
}
