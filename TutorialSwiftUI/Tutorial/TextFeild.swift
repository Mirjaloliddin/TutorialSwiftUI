//
//  TextFeild.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 31/03/23.
//

import SwiftUI

struct TextFeild: View {
    @State private var name = ""
    @State private var password = ""

    var body: some View {
        VStack{
            TextField("Enter Your Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Hello \(name)")
            SecureField("enter your password", text: $password)
                .padding()
            Text("you entered \(password)")
        }

    }
}

struct TextFeild_Previews: PreviewProvider {
    static var previews: some View {
        TextFeild()
    }
}
