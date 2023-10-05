////
//import SwiftUI
//
//
//
//struct Picker: View {
//    
//    var colors = ["black", "white", "yellow", "green", "red"]
//    @State private var selectedColor = 0
//    
//    var body: some View {
//      
//        VStack{
//            Picker(selection: $selectedColor, label: Text("choose a color")) {
//                ForEach(0..<colors.count) { i in
//                    Text(self.colors[i])
//                }
//            }.pickerStyle(SegmentedPickerStyle())
//            Text("you selected \(colors[selectedColor])")
//        }
//    }
//}
//
//struct Picker_Previews: PreviewProvider {
//    static var previews: some View {
//        Picker()
//    }
//}
