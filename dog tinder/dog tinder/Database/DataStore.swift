//
//  DataStore.swift
//  dog tinder
//
//  Created by Derrick Lee on 12/3/20.
//

import Foundation
var saveDogs: [storeDog] = []
var saveUsers: [storeUser] = []
class storeDog: Codable {
    var image: String
    var name: String
    var breed: String
    var gender: String
    var temperament: String
    var size: String
    var weight: String
    var description: String
    
    func convertInfo(dog: Dog) {
        image = dog.image
        name = dog.name
        breed = dog.breed.rawValue
        gender = dog.gender.rawValue
        temperament = dog.temperament
        size = dog.size.rawValue
        weight = dog.weight
        description = dog.description
    }
}
class storeUser: Codable {
    var userImage: String
    var firstName: String
    var lastName: String
    var city: String
    var state: String
    var email: String
    var morning: Bool = false
    var afterNoon: Bool = false
    var night: Bool = false
    
    func convertInfo(user: User) {
        userImage = user.userImage
        firstName = user.firstName
        lastName = user.lastName
        city = user.city
        state = user.state
        email = user.email
    }
}
func addDogtoList(dawg: storeDog) {
    saveDogs.append(dawg)
}
func addUsertoList(users: storeUser) {
    saveUsers.append(users)
}
func storeDataDogs() {
    let documentsDirectory =
      FileManager.default.urls(for: .documentDirectory,
      in: .userDomainMask).first!
    let archiveURL =
      documentsDirectory.appendingPathComponent("dogList").appendingPathExtension("plist")
    let propertyListEncoder = PropertyListEncoder()
    let encodedNotes = try? propertyListEncoder.encode(saveDogs)
    try? encodedNotes?.write(to: archiveURL,
      options: .noFileProtection)
}
func grabDogData() {
    let documentsDirectory =
      FileManager.default.urls(for: .documentDirectory,
      in: .userDomainMask).first!
    let archiveURL =
      documentsDirectory.appendingPathComponent("dogList").appendingPathExtension("plist")
    let propertyListDecoder = PropertyListDecoder()
    if let retrievedNotesData = try? Data(contentsOf: archiveURL),
        let dog = try?
          propertyListDecoder.decode(Array<storeDog>.self, from:
          retrievedNotesData) {
        saveDogs.append(contentsOf: dog)
}
}
func storeDataUsers() {
    let documentsDirectory =
      FileManager.default.urls(for: .documentDirectory,
      in: .userDomainMask).first!
    let archiveURL =
      documentsDirectory.appendingPathComponent("userList").appendingPathExtension("plist")
    let propertyListEncoder = PropertyListEncoder()
    let encodedNotes = try? propertyListEncoder.encode(saveUsers)
    try? encodedNotes?.write(to: archiveURL,
      options: .noFileProtection)
}
func grabDataUsers() {
    let documentsDirectory =
      FileManager.default.urls(for: .documentDirectory,
      in: .userDomainMask).first!
    let archiveURL =
      documentsDirectory.appendingPathComponent("dogList").appendingPathExtension("plist")
    let propertyListDecoder = PropertyListDecoder()
    if let retrievedNotesData = try? Data(contentsOf: archiveURL),
        let user = try?
          propertyListDecoder.decode(Array<storeUser>.self, from:
          retrievedNotesData) {
        saveUsers.append(contentsOf: user)
}
}
