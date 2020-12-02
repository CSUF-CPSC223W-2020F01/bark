//
//  DetailedViewSimple.swift
//  dog tinder
//
//  Created by Blue Bayani on 12/1/20.
//

import Foundation
import MessageUI
import SwiftUI
import UIKit

// the detailed view used in the user profile when a dog is clicked. doesn't include the contact owner button
struct detailedViewSimple: View {
    @ObservedObject var dog: Dog
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image(dog.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    VStack {
                        Text(dog.name)
                            .font(.system(size: 32, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.black)
                        Text(dog.breed.rawValue)
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                        Text(dog.gender.rawValue)
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                        Text(dog.temperament)
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                        Text(dog.size.rawValue)
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                        Text("\(dog.weight) pounds")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                        Text(dog.description)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                    }.layoutPriority(100)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
            }
        }
    }
}
