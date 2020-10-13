//
//  User.swift
//  dog tinder
//
//  Created by Derrick Lee on 10/11/20.
//

import Foundation
class User : ObservableObject {
  @Published  var firstName: String = "John"
  @Published  var lastName: String = "Smith"
  @Published  var city: String = "NYC"
  @Published  var state: String = "NY"
  @Published  var noon: Bool = false
  @Published  var afterNoon: Bool = false
  @Published  var night: Bool = false
  @Published  var listOfDogs: [String: Dog] = [:]
    
    init(firstName: String, lastName: String, city: String, state: String, noon: Bool, afterNoon: Bool, night: Bool, petName: String, Dog: Dog){
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
        self.state = state
        self.noon = noon
        self.afterNoon = afterNoon
        self.night = night
        self.listOfDogs = [Dog.name : Dog]
    }
}
