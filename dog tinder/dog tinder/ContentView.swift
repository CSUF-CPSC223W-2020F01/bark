import SwiftUI

struct ContentView: View {
    var body: some View {
        //TabView displays the bottom navigation bar. (Home, Chat, and Profile)
        //each .tabItem is clickable. when pressed, it will lead the user the the view indicated before the "."
        TabView {
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
//            ChatView().tabItem {
//                Image(systemName: "message")
//                Text("Chat")
//            }
            UserProfileView().tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
