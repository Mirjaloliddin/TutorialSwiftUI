//
//  DesignUI.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 01/04/23.
//

import SwiftUI

struct DesignUI: View {
    
    @State var date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Trip date", selection:  $date, in: Date()...,
                           displayedComponents: .date )
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                .padding()
            }
            .navigationTitle("Calendar")
        }
    }
}

struct DesignUI_Previews: PreviewProvider {
    static var previews: some View {
        DesignUI()
    }
}
