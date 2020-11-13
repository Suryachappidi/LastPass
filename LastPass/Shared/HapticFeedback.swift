//
//  HapticFeedback.swift
//  LastPass
//
//  Created by Surya Chappidi on 13/11/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

enum HapticFeedback {
    public static func generate() {
        let generator  = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
}
