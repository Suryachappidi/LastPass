//
//  FormModifier.swift
//  LastPass
//
//  Created by Surya Chappidi on 13/11/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct FormModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding()
            .background(Color.background)
            .cornerRadius(10)
            .padding()
            .neumorphic()
    }
}
