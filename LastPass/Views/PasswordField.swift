//
//  PasswordField.swift
//  LastPass
//
//  Created by Surya Chappidi on 13/11/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct PasswordField: View {
    @Binding var value: String
    var header = "Username"
    var placeholder = "Your Password"
    var trailingIconName = ""
    var errorMessage = ""
    var showUnderLine = true
    var onEditingChanged:((Bool)->()) = {_ in}
    var onCommit: (() -> ()) = {}
    @State var isSecure: Bool = true
    let pasteboard = UIPasteboard.general
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(header.uppercased())
                .font(.footnote)
                .foregroundColor(.gray)
            HStack{
                ZStack{
                    
                    SecureField(placeholder, text: self.$value,onCommit: {
                        self.onEditingChanged(false)
                    }).padding(.vertical,15).opacity(isSecure ? 1 : 0)
                    
                    TextField(placeholder, text: self.$value,onEditingChanged: { flag in
                        self.onEditingChanged(flag)
                    }).padding(.vertical,15).opacity(isSecure ? 0 : 1)
                    
                }
                
                HStack{
                    if isSecure{
                        Image(systemName: "eye.slash")
                            .foregroundColor(Color.gray)
                            .onTapGesture {
                                withAnimation {
                                    self.isSecure.toggle()
                                }
                        }
                    }
                    else {
                        Image(systemName: "eye")
                            .foregroundColor(Color.gray)
                            .onTapGesture {
                                withAnimation{
                                    self.isSecure.toggle()
                                }
                        }
                    }
                    if !isSecure{
                        Image(systemName: self.trailingIconName)
                            .foregroundColor(.gray)
                            .transition(.opacity)
                            .onTapGesture {
                                self.pasteboard.string = self.value
                        }
                    }
                }
            }
            .frame(height:45)
            
            if showUnderLine{
                Rectangle()
                    .frame(height:1)
                    .foregroundColor(.gray)
            }
            
            if !errorMessage.isEmpty{
                Text(errorMessage)
                    .lineLimit(nil)
                    .font(.footnote)
                    .foregroundColor(Color.red)
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
        }.background(Color.background)
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(value: .constant(""))
    }
}
