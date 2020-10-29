//dog.swift
//
//  Dog.swift
//  dog tinder
//
//  Created by Derrick Lee on 10/11/20.
//

import Foundation
struct Dog : Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var breed: String
    var gender: String
    var temperament: String
    var size: String
    var weight: Int
    var description: String
}
