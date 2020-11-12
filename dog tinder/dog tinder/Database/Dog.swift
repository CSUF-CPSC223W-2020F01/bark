//dog.swift
//
//  Dog.swift
//  dog tinder
//
//  Created by Derrick Lee on 10/11/20.
//  Edited by Miguel Macias on 10/29/20
//     Comment: Created Dog into a class to be able to change data 
//
import Foundation

enum Breed: String, CaseIterable, Identifiable{
    case Pomeranian = "Pomeranian"
    case Husky = "Husky"
    case Pitbull = "Pitbull"
    case Pug = "Pug"
    case GermanShephard = "German Shephard"
    case Poodle = "Poodle"
    case EnglishBulldog = "English Bulldog"
    case GoldenRetriever = "Golden Retriever"
    
    var id: String {self.rawValue}
}

enum Size: String, CaseIterable, Identifiable{
    case teacup = "Teacup"
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    case unit = "Absolute Unit"
    
    var id: String {self.rawValue}
}

enum Gender: String, CaseIterable, Identifiable{
    case male = "Male"
    case female = "Female"
    
    var id: String {self.rawValue}
}

class Dog : Identifiable, ObservableObject{
    @Published var id = UUID()
    @Published var image: String
    @Published var name: String
    @Published var breed: Breed
    @Published var gender: Gender
    @Published var temperament: String
    @Published var size: Size
    @Published var weight: String
    @Published var description: String
    
    init (image: String, name: String, breed: Breed, gender: Gender, temperament: String, size: Size , weight: String , description: String){
        self.image = image
        self.name = name
        self.breed = breed
        self.gender = gender
        self.temperament = temperament
        self.size = size
        self.weight = weight
        self.description = description
        
    }
    
    func hasPrefix(_ prefix: String) ->Bool{
        /*for(_, attribute) in Mirror(reflecting: self).children.enumerated(){
            if (attribute.label as String?) != nil{
                if attribute.label!.hasPrefix(prefix) || prefix == "" {
                    return true
                }
            }
        }
        return false
    }
 */
        if self.name.hasPrefix(prefix) || self.breed.rawValue.hasPrefix(prefix) || self.gender.rawValue.hasPrefix(prefix) || self.temperament.hasPrefix(prefix) || self.weight.hasPrefix(prefix) || self.description.hasPrefix(prefix){
            return true
        } else {
            return false
        }
    }
}
