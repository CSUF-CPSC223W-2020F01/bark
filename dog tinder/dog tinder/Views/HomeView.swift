//
//  HomeView.swift
//  dog tinder
//
//  Created by Blue Bayani on 10/8/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var profile: User = user
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(userArr, id:\.id) { prf in
                    ForEach(prf.listOfDogs, id: \.id) { dog in
                        NavigationLink(destination: detailedView(dog: dog,profile: prf)) {
                            LargeDogCard(dog: dog)
                        }.padding(0)
                    }
                    }
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

