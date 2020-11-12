//
//  HomeView.swift
//  dog tinder
//
//  Created by Blue Bayani on 10/8/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var profile: User = user
    @State var searchText: String = ""
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $searchText)
                
                    }
                }.padding()
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
            ScrollView {
                LazyVStack {
                    ForEach(userArr, id:\.id) { prf in
                        ForEach(prf.listOfDogs.filter{$0.hasPrefix(searchText) || searchText == ""}, id: \.id) { dog in
                        NavigationLink(destination: detailedView(dog: dog, profile: prf)) {
                            LargeDogCard(dog: dog)
                        }.padding(0)
                    }
                    }
                }
            }
            }
            .navigationBarTitle("Home")
        }
    }
}

