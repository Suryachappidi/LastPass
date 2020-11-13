//
//  SharedTextfield.swift
//  LastPass
//
//  Created by Surya Chappidi on 13/11/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct SharedTextfield: View {
    @Binding var value: String
    var header = "Username"
    var placeholder = "Your Username or Email"
    var trailingIconName = ""
    var errorMessage = ""
    var showUnderLine = true
    var onEditingChanged:((Bool)->()) = {_ in}
    var onCommit: (() -> ()) = {}
   
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            Text(header.uppercased())
                .font(.footnote)
                .foregroundColor(Color.gray)
            HStack{
                TextField(placeholder,text: self.$value,onEditingChanged: { flag in
                    self.onEditingChanged(flag)
                }, onCommit: {
                    self.onCommit()
                }).padding(.vertical,15)
                
                if !self.trailingIconName.isEmpty{
                    Image(systemName: self.trailingIconName)
                        .foregroundColor(.gray)
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

struct SharedTextfield_Previews: PreviewProvider {
    static var previews: some View {
        SharedTextfield(value: .constant(""))
    }
}
