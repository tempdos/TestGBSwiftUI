//
//  Data.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 03.05.2022.
//

import Foundation


let userResponse: [UserResponse] = load("userModelData.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("No File")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("No load file")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
