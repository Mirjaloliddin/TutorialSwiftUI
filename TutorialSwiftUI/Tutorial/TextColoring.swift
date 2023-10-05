//
//  TextColoring.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 31/03/23.
//

import SwiftUI

struct TextColoring: View {
    var body: some View {
        Text("Let's style our text views with fonts, colors and line spacing")
            .tracking(3)
            .background(Color.blue)
            .foregroundColor(.white)
            .lineLimit(nil)
            .truncationMode(.middle)
            .lineSpacing(20)
            .font(.largeTitle)
            .multilineTextAlignment(.center)
        
        
        
        
    }
}

struct TextColoring_Previews: PreviewProvider {
    static var previews: some View {
        TextColoring()
    }
}
