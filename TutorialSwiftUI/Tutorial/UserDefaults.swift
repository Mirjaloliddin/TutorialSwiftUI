//
//  UserDefaults.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 30/03/23.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var secondName: String
}

struct UserDeafultsView: View {
    @State private var user = User(firstName: "Mirjalol", secondName: "Murtzaev")
    
    var body: some View {
        
        Button("save user"){
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user){
                UserDefaults.standard.set(data, forKey: "userdata")
                print(user)
            }
        }
    }
}
        
    struct  UserDeafultsView_Previews: PreviewProvider {
        static var previews: some View {
            UserDeafultsView()
        }
    }
