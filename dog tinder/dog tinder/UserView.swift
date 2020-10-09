// USER VIEW
// IMPLEMENTATION 1 TO DO:

//display user information on the screen.
//move pencil icon to the top right of the page.
//create view for editing the user info
	//includes: text fields (name, city, state), toggle boxes (availibility: morning, noon, night), and adding and deleting the list of dog objects (name for now)

import SwiftUI

struct UserView: View {
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
   var body: some View {
	  Text("edit view")
   }
}
struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserView()
        }
    }
}
