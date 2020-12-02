//
//  MailView.swift
//  dog tinder
//
//  Created by Blue Bayani on 12/1/20.
//

import Foundation
import MessageUI
import SwiftUI
import UIKit

// code to open a view to compose an email over the current view
struct MailView: UIViewControllerRepresentable {
    @ObservedObject var dog: Dog
    @ObservedObject var profile: User
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>)
        {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?)
        {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        // populates the email with dog's name, owners email, and a default message
        let vc = MFMailComposeViewController()
        vc.setToRecipients(["\(profile.email)"])
        vc.setSubject("Bark! Inquiry about \(dog.name)")
        vc.setMessageBody("Hello! I am emailing to let you know im interested in \(dog.name) and I would love to discuss more with you :)", isHTML: false)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {}
}
