//
//  GeneralMenu.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 31/03/23.
//

import SwiftUI

struct GeneralMenu: View {
    
    @State private var userName = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        
        ZStack{
            VStack{
                
                Image(systemName: "cloud.fill")
                    .aspectRatio( contentMode: .fit)
                    .font(.system(size: 120))
                    .foregroundColor(.blue)
                
                HStack{
                    ZStack{
                           
                            TextField("Enter Your Name", text: $userName)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                    }
                }
                Text("Hello \(userName)")
                    .foregroundColor(.blue)
                ZStack {
                    
                    HStack {
                        
                        if showPassword {
                            TextField("Password",
                                      text: $password)
                        } else {
                            SecureField("Password",
                                        text: $password)
                        }
                        Button(action: { self.showPassword.toggle()}) {
                            
                            Image(systemName: "eye")
                                .foregroundColor(.secondary)
                        }
                        
                        
                    }
                    
                    .padding(10)
                    .background(Capsule().fill(Color.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
            }
        }
        
    }
}

struct GeneralMenu_Previews: PreviewProvider {
    static var previews: some View {
        GeneralMenu()
    }
}
