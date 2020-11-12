
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
                    .navigationBarItems(trailing: HStack { AddButton(destination: EditView(profile: profile)) })
                    .groupBoxStyle(/*@START_MENU_TOKEN@*/DefaultGroupBoxStyle()/*@END_MENU_TOKEN@*/)
                LazyVStack {
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

struct EditView: View {
    @ObservedObject var profile: User
    var body: some View {
        // removed Form{} wrapper around the stacks. it just made things look funnyS
        
            /*VStack(alignment: .leading, spacing: 5)*/ Form{
                Section(header: Text("Your profile")){
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
                
                Section(header: Text("Your Fluffy Animals")){
                List {
                    ForEach(profile.listOfDogs, id: \.id) { dog in
                        NavigationLink(destination: EditDog(profile: profile, dog: dog)) {
                            Text(dog.name)
                        }
                    }
                    .onDelete(perform: delete)
                    .onTapGesture(perform: {
                        print("Pressed")
                        // NavigationLink(destination: EditDog(dog:user.listOfDogsp[$0])){}

                        // ForEach(profile.listOfDogs, id: \.id) { dog in
                        // NavigationLink(destination: EditDog(dog:dog)){}
                        // }
                    })
                    
                    Button(action:{
                        addRow(profile: profile)
                    }){
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
        let defaultDog = Dog(image: "dog", name: "Dog name", breed: .Pomeranian, gender: .male, temperament: "good", size: .small, weight: "12", description: "very good dog")
        profile.listOfDogs.append(defaultDog)
    }

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserProfileView()
        }
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

struct EditDog: View {
    @ObservedObject var profile: User
    @ObservedObject var dog: Dog
    @State private var showCancelButton: Bool = false
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Image(dog.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding()
            Button(action: {print("Button pressed")} ){
                Image(systemName: "pencil")
                    .background(Circle()
                                    .fill(Color.white)
                                    .frame(width:50, height: 50)
                    )
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 100, height: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
                
        }
            Form{
                TextField("Dog Name", text: $dog.name)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                Picker("Breed", selection: $dog.breed){
                    ForEach(Breed.allCases, id: \.self){ breed in
                        Text(breed.rawValue)
                    }
                }
                
                Picker("Gender", selection: $dog.gender){
                    ForEach(Gender.allCases, id: \.self){ gender in
                        Text(gender.rawValue)
                    }
                }
                TextField("Temperament", text: $dog.temperament)
                
                Picker("Size", selection: ($dog.size)){
                ForEach(Size.allCases, id: \.self){ size in
                    Text(size.rawValue)
                    }
                }
                TextField("Weight", text: $dog.weight)
                    .keyboardType(.numberPad)
                TextField("Description", text: $dog.description)
                    
            }
            //.padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Edit \(dog.name)")
        //}
    }
}

func editPhoto(){
    
}

extension UIApplication{
    func endEditing(_ force: Bool){
        self.windows
            .first?
            .endEditing(force)
    }
}
    
