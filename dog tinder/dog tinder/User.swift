//user.swift
//
//  User.swift
//  dog tinder
//
//  Created by Derrick Lee on 10/11/20.
//

import Foundation
import UIKit
import SwiftUI

class User : ObservableObject {
  @Published  var userImage: String
  @Published  var firstName: String = "John"
  @Published  var lastName: String = "Smith"
  @Published  var city: String = "NYC"
  @Published  var state: String = "NY"
  @Published  var morning: Bool = false
  @Published  var afterNoon: Bool = false
  @Published  var night: Bool = false
  @Published  var listOfDogs: [Dog] = []
    
    init(firstName: String, lastName: String, city: String, state: String, morning: Bool, afterNoon: Bool, night: Bool, listOfDogs: [Dog]){
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
        self.state = state
        self.morning = morning
        self.afterNoon = afterNoon
        self.night = night
        self.userImage = "MiguelLee"
        self.listOfDogs.append(contentsOf: listOfDogs)
    }
}
