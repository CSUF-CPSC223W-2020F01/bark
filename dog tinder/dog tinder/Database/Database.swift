//
//  Database.swift
//  dog tinder
//
//  Created by Derrick Lee on 10/15/20.
//

import Foundation

var placeholderDesc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisis, urna a bibendum convallis, est diam convallis ante, sed luctus orci leo id nulla. Nunc eget turpis congue, tempor ex nec, consectetur odio."
var pompom: Dog = Dog(image: "pompom", name: "Pebbles", breed: "Pomeranian", gender: "F", temperament: "Lazy", size: "7' ", weight: 5 , description: placeholderDesc)
var husky: Dog = Dog(image: "husky", name: "Dot", breed: "Husky", gender: "M", temperament: "Active", size: "24' ", weight: 55 , description: placeholderDesc)
var bulldog: Dog = Dog(image: "englishbulldog", name: "Bobbie", breed: "English Bulldog", gender: "M", temperament: "Shy", size: "13' ", weight: 50 , description: placeholderDesc)
var goldie: Dog = Dog(image: "goldie", name: "Big Boy", breed: "Golden Retriever", gender: "F", temperament: "Active", size: "22' ", weight: 65 , description: placeholderDesc)


var user: User = User(firstName:"Miguel", lastName: "Lee", city: "Fontana", state: "California", email: "miguel@gmail.com", morning: true, afterNoon: true, night: true, listOfDogs: [pompom, husky])
var user2: User = User(firstName:"Blue", lastName: "Bayani", city: "Fremon", state: "California", email: "blueb@gmail.com", morning: true, afterNoon: true, night: true, listOfDogs: [bulldog, goldie])

var userArr: [User] = [user,user2]

