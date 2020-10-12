//
//  User.swift
//  dog tinder
//
//  Created by Derrick Lee on 10/11/20.
//

import Foundation
struct User {
    var firstName: String
    var lastName: String
    var city: String
    var state: String
    var timeOfDay: Double
    var listOfDogs: [String: Dog] = [:]
}
