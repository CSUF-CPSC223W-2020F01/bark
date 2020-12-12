//
//  EditUserView.swift
//  dog tinder
//
//  Created by Miguel Macias on 12/11/20.
//

import Foundation
import SwiftUI

//called when the edit icon is clicked
//allows users to edit their profile details
struct EditView: View {
    @ObservedObject var profile: User
    var body: some View {
        Form {
            Section(header: Text("Your profile")) {
                Text("First Name")
                    .font(.callout)
                    .bold()
                TextField("\(profile.firstName)", text: $profile.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Last Name")
                    .font(.callout)
                    .bold()
                TextField("\(user.lastName)", text: $profile.lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("City")
                    .font(.callout)
                    .bold()
                TextField("\(profile.city)", text: $profile.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("State")
                    .font(.callout)
                    .bold()
                TextField("\(profile.state)", text: $profile.state).textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Email")
                    .font(.callout)
                    .bold()
                TextField("\(profile.email)", text: $profile.email).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            //users can also edit their dogs
            Section(header: Text("Your Fluffy Animals")) {
                List {
                    //lists all dogs by their name
                    ForEach(profile.listOfDogs, id: \.id) { dog in
                        //when clicked, takes the user to a new view where they can edit that particular dog's details
                        NavigationLink(destination: EditDog(profile: profile, dog: dog)) {
                            Text(dog.name)
                        }
                    }
                    //swipe to delete
                    .onDelete(perform: delete)
                    .onTapGesture(perform: {
                        print("Pressed")
                    })
                    //add a new dog entry
                    Button(action: {
                        addRow(profile: profile)
                    }) {
                        Text("Register A New Dog")
                    }
                }
                Spacer()
                    .navigationBarTitle(Text("Edit Profile"))
            }
        }
    }

    func delete(at offsets: IndexSet) {
        profile.listOfDogs.remove(atOffsets: offsets)
    }
}

func addRow(profile: User) {
    // add row function needs to be able to append a dog object. default is
    let defaultDog = Dog(image: UIImage(named: "pompom")!, name: "Dog name", breed: .Pomeranian, gender: .male, temperament: "good", size: .small, weight: "12", description: "very good dog")
    profile.listOfDogs.append(defaultDog)
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserProfileView()
        }
    }
}
