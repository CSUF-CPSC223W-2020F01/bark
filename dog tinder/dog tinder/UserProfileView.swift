// USER VIEW
// IMPLEMENTATION 1 TO DO:

//display user information on the screen.
//move pencil icon to the top right of the page.
//create view for editing the user info
    //includes: text fields (name, city, state), toggle boxes (availibility: morning, noon, night), and adding and deleting the list of dog objects (name for now)

import SwiftUI
var pompom: Dog = Dog(name: "Pebbles", breed: "Pomeranian", temperament: "Lazy", size: "12' ", weight: 15 , description: "Lazy but funny ")

var user: User = User(firstName:"Miguel", lastName: "Lee", city: "Fontana", state: "California", noon: false, afterNoon: true, night: true, petName: pompom.name, Dog: pompom)

struct UserProfileView: View {
    @ObservedObject var profile: User = user
   var body: some View {
      NavigationView {
        //when clicked, the page will change to edit view.
        NavigationLink(destination: EditView(profile: profile)) {
            VStack(alignment: .leading ,spacing: 5){
                Text("First, Last Name ")
                    .foregroundColor(Color.black)
                    .font(.callout)
                    .bold()
                Text("\(profile.firstName), \(profile.lastName) ")
                Text("City ")
                    .foregroundColor(Color.black)
                    .font(.callout)
                    .bold()
                Text("\(profile.city)")
                Text("State")
                    .foregroundColor(Color.black)
                    .font(.callout)
                    .bold()
                Text("\(profile.state)")
            }.padding()
            
           
            HStack(alignment: .bottom) {
                Image(systemName: "pencil")
                    
            }.padding()
            }.buttonStyle(DefaultButtonStyle())
        .navigationBarTitle("Your Profile")
      }
   }
}

struct EditView: View {
    @State private var dogs = ["Barker", "Spot", "Dot"]
    @State  var profile: User
        
        var body: some View {
            NavigationView {
                Form{
                VStack(alignment: .leading, spacing:5){
                      Text("First Name")
                              .font(.callout)
                              .bold()
                          TextField("\(profile.firstName)", text: $profile.firstName)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                          Text("Last Name")
                              .font(.callout)
                              .bold()
                          TextField("\(user.lastName)",text: $profile.lastName)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                          Text("City")
                              .font(.callout)
                              .bold()
                          TextField("\(profile.city)",text: $profile.city)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                          Text("State")
                              .font(.callout)
                              .bold()
                          TextField("\(profile.state)",text: $profile.state) .textFieldStyle(RoundedBorderTextFieldStyle())
                      
                      Group{
                          Form{
                              Toggle(isOn: $profile.noon){
                                  Text("Morning")
                              }
                              Toggle(isOn: $profile.afterNoon){
                                  Text("Noon")
                              }
                              Toggle(isOn: $profile.night){
                                  Text("Night")
                              }
                          }
                      }
                  }
                
                List {
                    ForEach(dogs, id: \.self) { dog in
                        Text(dog)
                    }
                    .onDelete(perform: delete)
                }
                .navigationBarTitle(Text("dogs"))
                .navigationBarItems(trailing: Button(action: {
                    self.addRow()
                }) {
                    Image(systemName: "plus")
                })
            }
        }
    }
        func addRow() {
            self.dogs.append("new dog")
        }
        func delete(at offsets: IndexSet) {
            dogs.remove(atOffsets: offsets)
        }
}
struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserProfileView()
        }
    }
}
