//
//  HomeView.swift
//  dog tinder
//
//  Created by Blue Bayani on 10/8/20.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 0)
    }
}

struct HomeView: View {
    @ObservedObject var profile: User = user
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(profile.listOfDogs, id: \.id) { dog in
                        NavigationLink(destination: detailedView(image: dog.image, name: dog.name, breed: dog.breed, gender: dog.gender, temperament: dog.temperament, size: dog.size, weight: dog.weight, description: dog.description)) {
                            dogCard(image: dog.image, name: dog.name, breed: dog.breed, gender: dog.gender)
                        }.padding(0)
                    }
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

struct detailedView: View {
    var image: String
    var name: String
    var breed: String
    var gender: String
    var temperament: String
    var size: String
    var weight: Int
    var description: String
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .center)
        HStack {
            VStack {
                Text(name)
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .foregroundColor(.black)
                Text(breed)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                Text(gender)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                Text(temperament)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                Text(size)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                Text("\(weight) pounds")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                Text(description)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.gray)
            }.layoutPriority(100)
        }
        Spacer()
    }
    }
}

struct dogCard: View {
    var image: String
    var name: String
    var breed: String
    var gender: String

    var body: some View {
        VStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(20)
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("\(breed), \(gender)")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                }.layoutPriority(100)
                Spacer()
            }.padding(.bottom)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
