//
//  SmallDogCard.swift
//  dog tinder
//
//  Created by Blue Bayani on 10/30/20.
//

import Foundation
import SwiftUI
import UIKit

struct SmallDogCard: View {
    @ObservedObject var dog: Dog

    var body: some View {
        HStack(alignment: .center) {
            Image(dog.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(20)
            HStack {
                VStack(alignment: .leading) {
                    Text(dog.name)
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(dog.breed.rawValue), \(dog.gender.rawValue)")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
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
        SmallDogCard(dog: pompom)
    }
 }
