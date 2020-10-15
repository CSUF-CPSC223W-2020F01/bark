//
//  Database.swift
//  dog tinder
//
//  Created by Derrick Lee on 10/15/20.
//

import Foundation
var pompom: Dog = Dog(name: "Pebbles", breed: "Pomeranian", temperament: "Lazy", size: "12' ", weight: 15 , description: "Lazy but funny ")
var husky: Dog = Dog(name: "Dot", breed: "husky", temperament: "Active", size: "24' ", weight: 100 , description: "Scary looking but nice")

var user: User = User(firstName:"Miguel", lastName: "Lee", city: "Fontana", state: "California", morning: true, afterNoon: true, night: true, listOfDogs: [pompom,husky])
