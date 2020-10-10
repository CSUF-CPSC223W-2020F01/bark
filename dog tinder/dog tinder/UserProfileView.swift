// USER VIEW
// IMPLEMENTATION 1 TO DO:

//display user information on the screen.
//move pencil icon to the top right of the page.
//create view for editing the user info
    //includes: text fields (name, city, state), toggle boxes (availibility: morning, noon, night), and adding and deleting the list of dog objects (name for now)

import SwiftUI

struct UserProfileView: View {
   var body: some View {
      NavigationView {
        //when clicked, the page will change to edit view.
         NavigationLink(destination: EditView()) {
            Image(systemName: "pencil")
         }.buttonStyle(DefaultButtonStyle())
      }
   }
}
struct EditView: View {
    @State private var dogs = ["Barker", "Spot", "Dot"]
   var body: some View {
    NavigationView {
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
