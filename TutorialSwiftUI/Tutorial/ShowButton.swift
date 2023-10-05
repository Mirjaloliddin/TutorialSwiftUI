//
//  ShowButton.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 31/03/23.
//

import SwiftUI

struct ShowButton: View {
    @State private var showDetail = false
    var body: some View {
        VStack {
            Button(action: {
                self.showDetail.toggle()
            }) {
                Text("show details")
            }
            if showDetail {
                Text("Some details herre...")
                    .font(.largeTitle)
            .clipShape (RoundedRectangle(cornerRadius: 20))
            }
        
        }
    }
}

struct ShowButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowButton()
    }
}
