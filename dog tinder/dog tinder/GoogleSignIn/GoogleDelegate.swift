//
//  GoogleDelegate.swift
//  dog tinder
//
//  Created by Miguel Macias on 12/3/20.
//

import Foundation
import GoogleSignIn
import SwiftUI
import UIKit
//Handles the actual sign-in
class GoogleDelegate: NSObject, GIDSignInDelegate, ObservableObject {
    
    @Published var signedIn = false
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue{
                print("The user has not signed into their accounr")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        //If here it means that have succesfully logged in so we can turn our signedIn to true
        print("Welcoome to Bark!")
        signedIn = true
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate{
    let googleDelegate = GoogleDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        GIDSignIn.sharedInstance().clientID = "874223766109-40pmsu87q1n47keekblh4m8s5ir9q7a5.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = googleDelegate
       // GIDSignIn.sharedInstance().scopes = Constants.GS.scopes
        
        return true
    }
    
    
}



//Google button
struct SignInButton: UIViewRepresentable {
    
    
    
    //This makes a dark button
    func makeUIView(context: Context) -> GIDSignInButton{
        let button = GIDSignInButton()
        button.colorScheme = .dark
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: Context) {}
}

//The View with the acutal button
struct SignInView: View {
    
    var body: some View {
        SignInButton()
    }
}
