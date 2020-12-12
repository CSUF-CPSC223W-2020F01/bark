
// USER VIEW
// IMPLEMENTATION 1 TO DO:

// display user information on the screen.
// move pencil icon to the top right of the page.
// create view for editing the user info
// includes: text fields (name, city, state), and adding and deleting the list of dog objects 

import SwiftUI

struct UserProfileView: View {
    
    @ObservedObject var profile: User = user

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    Image("\(profile.userImage)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 144, height: 144)
                        .clipShape(Circle())
                        .padding()
                        .clipped()
                    Text("\(profile.firstName), \(profile.lastName)")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.black)
                        .padding(.bottom, 4)
                    Text("\(profile.city), \(profile.state)")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.gray)
                }
                Spacer()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: .center)
                    .padding(.bottom, 10)
                    //places the edit icon in the upper right corner
                    .navigationBarItems(trailing: HStack { AddButton(destination: EditView(profile: profile)) })
                    .groupBoxStyle(/*@START_MENU_TOKEN@*/DefaultGroupBoxStyle()/*@END_MENU_TOKEN@*/)
                LazyVStack {
                    //displays all of the users dogs
                    ForEach(profile.listOfDogs, id: \.id) { dog in
                        NavigationLink(destination: detailedViewSimple(dog: dog)) {
                            SmallDogCard(dog: dog)
                        }
                    }
                }
            }
            .navigationBarTitle("Profile")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


// Work around to get a button to navigationBarItem and navigationLink to work together
// https://stackoverflow.com/questions/57024263/how-to-navigate-to-a-new-view-from-navigationbar-button-click-in-swiftui

struct AddButton<Destination: View>: View {
    var destination: Destination

    var body: some View {
        NavigationLink(destination: self.destination) { Image(systemName: "pencil") }
            .padding(.top)
    }
}


extension UIApplication {
    func endEditing(_ force: Bool) {
        windows
            .first?
            .endEditing(force)
    }
}

