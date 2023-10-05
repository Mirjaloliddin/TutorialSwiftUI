//
//  ZHVStack.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 31/03/23.
//

import SwiftUI

struct ZHVStack: View {
    var body: some View {
        ZStack {
            Image("apple")
            Text("Hello Apple")
                .font(.largeTitle)
                .background(Color.yellow)
                .foregroundColor(Color.white)
        
        }
    }
}

struct ZHVStack_Previews: PreviewProvider {
    static var previews: some View {
        ZHVStack()
    }
}
