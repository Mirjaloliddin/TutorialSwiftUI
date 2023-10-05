//
//  kontekstnoye menyu.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 03/04/23.
//

import SwiftUI

struct kontekstnoye_menyu: View {
    var body: some View {
        Image("city")
            .resizable()
            .frame(height: 300)
            .cornerRadius(30)
            .padding()
            .contextMenu {
                VStack{
                    Button(action: {
                        print("copy")
                    }) {
                        HStack{
                            Image(systemName: "doc.on.doc")
                            Text("copy")
                        }
                    }
                    Button(action: {
                        print("share")
                    }) {
                        HStack{
                            Image(systemName: "square.and.arrow.up")
                            Text("share")
                        }
                    }

                }
            }
    }
}

struct kontekstnoye_menyu_Previews: PreviewProvider {
    static var previews: some View {
        kontekstnoye_menyu()
    }
}
