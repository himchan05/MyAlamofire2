//
//  Model.swift
//  MyAlamofire2
//
//  Created by 박힘찬 on 2022/03/26.
//

import SwiftUI

struct JokesData: Codable {
    var type: String
    var value : [Joke]
}

struct Joke: Codable, Hashable {
    var id: Int
    var joke: String
}
