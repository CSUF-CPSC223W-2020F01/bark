//
//  detailedViewSimple1.swift
//  dog tinder
//
//  Created by Blue Bayani on 12/3/20.
//

import Foundation
import MessageUI
import SwiftUI
import UIKit

struct detailedViewSimple: View {
    @ObservedObject var dog: Dog
    var body: some View {
        ScrollView {
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
                            Text("\(dog.breed.rawValue), \(dog.gender.rawValue)")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 4, leading: 0, bottom: 10, trailing: 0))
                            Text("Description")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            Text(dog.description)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 4, leading: 0, bottom: 10, trailing: 0))
                            Text("Overview")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            Text("Temperament: \(dog.temperament)")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.gray)
                            Text("Size: \(dog.size.rawValue)")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.gray)
                            Text("Weight: \(dog.weight) pounds")
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
}
