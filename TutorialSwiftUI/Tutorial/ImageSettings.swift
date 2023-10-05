//
//  ImageSettings.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 31/03/23.
//

import SwiftUI

struct ImageSettings: View {
    var body: some View {
        Image("apple")
            .resizable()
            .aspectRatio(contentMode: .fit)
        
        
            Image(systemName: "globe")
                 .font(.largeTitle)
                 .padding(30)
                 .background(Color.green)
        
                 .foregroundColor(.blue)
                 .clipShape(RoundedRectangle(cornerRadius: 22))
         
    }
}

struct ImageSettings_Previews: PreviewProvider {
    static var previews: some View {
        ImageSettings()
    }
}
