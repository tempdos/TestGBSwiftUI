//
//  UserResponse.swift
//  TestGBSwiftUI
//
//  Created by Василий Слепцов on 03.05.2022.
//

import Foundation

struct UserResponse: Decodable, Identifiable {
    var id: Int
    
    var name: String
    var image: String
    var photos: [Photos]
}

struct Photos: Decodable, Identifiable {
    var id: Int
    var filename: String
}
