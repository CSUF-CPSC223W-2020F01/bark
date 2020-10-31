//
//  CardModifier.swift
//  dog tinder
//
//  Created by Blue Bayani on 10/30/20.
//

import Foundation
import SwiftUI
import UIKit

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 0)
    }
}
