
// USER VIEW
// IMPLEMENTATION 1 TO DO:

// display user information on the screen.
// move pencil icon to the top right of the page.
// create view for editing the user info
// includes: text fields (name, city, state), toggle boxes (availibility: morning, noon, night), and adding and deleting the list of dog objects (name for now)

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var profile: User = user
    var body: some View {
        NavigationView {
            // when clicked, the page will change to edit view.
            NavigationLink(destination: EditView(profile: profile)) {
                VStack(alignment: .center, spacing: 5) {
                    Text("\(profile.firstName) \(profile.lastName) ")
                    Text("\(profile.city), \(profile.state)")
                    Text("Availability:")
                    if profile.morning && profile.afterNoon && profile.night {
                        Text("All day")
                    }
                    else {
                        if profile.morning && profile.afterNoon {
                            Text("Morning and afternoon")
                        }
                        if profile.morning && profile.night {
                            Text("Morning and night")
                        }
                        if profile.afterNoon && profile.night {
                            Text("Afternoon and night")
                        }
                        else {
                            if profile.morning {
                                Text("Morning")
                            }
                            if profile.afterNoon {
                                Text("Afternoon")
                            }
                            if profile.night {
                                Text("Night")
                            }
                        }
                    }
                    ForEach(profile.listOfDogs, id: \.id) { dog in
                        Text(dog.name)
                    }
                }.padding()
            }.buttonStyle(DefaultButtonStyle())
                .navigationBarTitle("Your Profile")
        }
    }
}

struct EditView: View {
    @ObservedObject var profile: User
    var body: some View {
        //removed Form{} wrapper around the stacks. it just made things look funnyS
        VStack(alignment: .leading, spacing: 5) {
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
        }
        VStack {
            Group {
                Toggle(isOn: $profile.morning) {
                    Text("Morning")
                }
                Toggle(isOn: $profile.afterNoon) {
                    Text("Afternoon")
                }
                Toggle(isOn: $profile.night) {
                    Text("Night")
                }
            }
        }
        VStack {
            NavigationView {
                List {
                    ForEach(profile.listOfDogs, id: \.id) { dog in
                        Text(dog.name)
                    }
                    .onDelete(perform: delete)
                }
                .navigationBarTitle(Text("Edit Dogs"))
                .navigationBarItems(trailing: Button(action: {
                    self.addRow()
                }) {
                    Image(systemName: "plus")
                })
            }
        }
    }

    func addRow() {
        // add row function needs to be able to append a dog object. default is
        let defaultDog = Dog(image: "dog", name: "Dog name", breed: "a good dog", gender: "F", temperament: "good", size: "6' ", weight: 12, description: "very good dog")
        profile.listOfDogs.append(defaultDog)
    }

    func delete(at offsets: IndexSet) {
        profile.listOfDogs.remove(atOffsets: offsets)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserProfileView()
        }
    }
}
