//
//  Database.swift
//  dog tinder
//
//  Created by Derrick Lee on 10/15/20.
//

import Foundation
var pompom: Dog = Dog(image: "pompom", name: "Pebbles", breed: "Pomeranian", gender: "F", temperament: "Lazy", size: "7' ", weight: 5 , description: "Lazy but funny ")
var husky: Dog = Dog(image: "husky", name: "Dot", breed: "Husky", gender: "M", temperament: "Active", size: "24' ", weight: 55 , description: "Scary looking but nice")
var bulldog: Dog = Dog(image: "englishbulldog", name: "Bobbie", breed: "English Bulldog", gender: "M", temperament: "Shy", size: "13' ", weight: 50 , description: "Scary looking but nice")
var goldie: Dog = Dog(image: "goldie", name: "Big Boy", breed: "Golden Retriever", gender: "F", temperament: "Active", size: "22' ", weight: 65 , description: "Scary looking but nice")


var user: User = User(firstName:"Miguel", lastName: "Lee", city: "Fontana", state: "California", morning: true, afterNoon: true, night: true, listOfDogs: [pompom, husky, bulldog, goldie])
