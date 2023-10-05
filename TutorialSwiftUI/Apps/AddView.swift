//
//  AddView.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 30/03/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses:  Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    var typs = ["Bussines","Personal"]
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Названия", text: $name)
                Picker("Тип", selection: $type){
                    ForEach(self.typs, id: \.self) {
                        Text($0)
                        
                    }
                }
                TextField("stoimost", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("adddd")
            .navigationBarItems(trailing: Button("save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
