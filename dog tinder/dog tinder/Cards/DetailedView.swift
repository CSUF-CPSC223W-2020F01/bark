//
//  DetailedView.swift
//  dog tinder
//
//  Created by Blue Bayani on 10/30/20.
//

import Foundation
import MessageUI
import SwiftUI
import UIKit

// used on home page when a dog card is clicked
struct detailedView: View {
    @ObservedObject var dog: Dog
    @ObservedObject var profile: User
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(dog.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 32, bottom: 20, trailing: 32))
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

                        // MARK: works with iOS devices with the mail app installed. is disabled for xcode simulators due to lack of mail app

                        Button(action: {
                            self.isShowingMailView.toggle()
                        }) {
                            Text("Ask about \(dog.name)")
                                .font(.system(size: 18, weight: .bold, design: .default))
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(8)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .disabled(!MFMailComposeViewController.canSendMail())
                        .sheet(isPresented: $isShowingMailView) {
                            MailView(dog: dog, profile: profile, result: self.$result)
                        }
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
