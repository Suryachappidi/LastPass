//
//  NeumorphicEffect.swift
//  LastPass
//
//  Created by Surya Chappidi on 13/11/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct NeumorphicEffect: ViewModifier {
    func body(content: Content) -> some View{
        content
            .shadow(color: Color.darkShadow, radius: 10, x: 9, y: 9)
            .shadow(color: Color.lightShadow, radius: 10, x: -9, y: -9)
    }
}

extension View{
    func neumorphic() -> some View {
        return self.modifier(NeumorphicEffect())
    }
}
