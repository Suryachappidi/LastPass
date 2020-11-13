//
//  NotificationCenterExt.swift
//  LastPass
//
//  Created by Surya Chappidi on 13/11/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import UIKit

extension NotificationCenter {
    private static let keyboardWillShow = NotificationCenter.Publisher(center: .default, name: UIResponder.keyboardWillShowNotification)
    private static let keyboardWillHide = NotificationCenter.Publisher(center: .default, name: UIResponder.keyboardDidHideNotification)
    
    static var keyboardPublisher = NotificationCenter.keyboardWillShow.merge(with: NotificationCenter.keyboardWillHide.map{
        Notification(name: $0.name, object: $0.object, userInfo: nil)
    })
        .map{ ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero) }
}
