//
//  ContentView.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 28/03/23.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items){
                self.items = decoded
                return
            }
        }
    }
}

struct ContentView: View {
    @State private var showingAddExpense = false
    @ObservedObject var expenses = Expenses()
  
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type )
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeOffset)
            }
            .navigationBarTitle("Мои расходы")
            .navigationBarItems( trailing:
                                    Button(action:{
                self.showingAddExpense = true
            }){
                Image(systemName: "plus")
            })
            .sheet(isPresented:  $showingAddExpense){
                AddView(expenses: self.expenses)
            }
        }
    }
    func removeOffset(as offsets: IndexSet ){
        expenses.items.remove(atOffsets: offsets)
    }
}








        
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    
    
    // MARK: ZStack HStack VStack

    
    // MARK: text color spacing ...
    
    
    // MARK: image fill fit ...
    
    
 
    
    
    // MARK: Gradient
    

    
    // MARK: Angular radial gradient
    
 
    
    // MARK: show detail button
    

    
    // MARK: textFeild
    

    
    // MARK: secureTextFeild
    

    
    // MARK: Slider
    
   
    
    // MARK: picker
    
    
    
    
    // MARK: stepper
    
    //@State private var age = 15
    
    //Stepper("enter your age", value: $age, in: 0...130)
    //Text("your age \(age)")
    //
    //VStack{
    //    Stepper("enter your age", onIncrement: { self.age += 1},
    //            onDecrement: {self.age -= 1})
    //    Text("your age is \(age)")
    //}
    
    // MARK: Tapped
    
    //Text("Tap me")
    //    .onTapGesture {
    //        print("Tapped")
    //    }
    
    //    Image("apple")
    //        .resizable()
    //        .aspectRatio(contentMode: .fit)
    //        .onTapGesture(count: 2) {
    //             print("2 tap")
    //        }
    //        Spacer()
    //    Text("applee")
    //
    //} .contentShape(Rectangle())
    //.onTapGesture {
    //    print("touch")
    //}
    
    //    .gesture(
    //        LongPressGesture(minimumDuration: 2) .onEnded{
    //            _ in
    //            print("pressed")
    //        }
    //        )
    //Image("apple")
    //    .resizable()
    //    .aspectRatio(contentMode: .fit)
    //    .gesture(
    //        DragGesture(minimumDistance: 50) .onEnded{
    //            _ in
    //            print("dragged")
    //        }
    //        )
    
    // MARK: List - tebleView header footer
    
    //struct musicRow: View {
    //        var name : String
    //
    //        var body: some View {
    //            Text("Music \(name)")
    //        }
    //    }
    //List {
    //    musicRow(name: "rock")
    //    musicRow(name: "raap")
    //    musicRow(name: "classical")
    //    musicRow(name: "rock")
    //    musicRow(name: "raap")
    //    musicRow(name: "classical")
    //    musicRow(name: "rock")
    //    musicRow(name: "raap")
    //    musicRow(name: "classical")
    //
    //
    //}
    
    
    //struct Restaurant: Identifiable {
    //    var id = UUID()
    //    var name: String
    //}
    //
    //struct RestaurantRaw: View {
    //    var restaurant: Restaurant
    //    var body: some View {
    //        Text ("Come and eat at \(restaurant.name)")
    //    }
    //}
    //let first = Restaurant (name: "FirstRestaurant" )
    //let second = Restaurant (name: "SecondRestaurant" )
    //let third = Restaurant (name: "ThirdRestaurant" )
    //let restaurants = [first, second, third]
    //return List(restaurants) { restaurant in
    //    RestaurantRaw (restaurant: restaurant)
    //}
    //     header, footer
    
    //struct TaskRow: View {
    //    var body: some View {
    //    Text("some task")
    //    }
    //}
    
    //List {
    //    Section(header: Text("important Task"), footer: Text("end")) {
    //        TaskRow()
    //        TaskRow()
    //        TaskRow()
    //    }.listRowBackground(Color.blue)
    //    Section(header: Text("Other Task")) {
    //        TaskRow()
    //        TaskRow()
    //        TaskRow()
    //    }.listRowBackground(Color.yellow)
    //
    //} .listStyle(GroupedListStyle())
    
    // MARK: navigationview boloba knopka
//            NavigationView{
//         Text("SwiftUI")
//        .navigationBarTitle("Welcome", displayMode: .inline)
//        .navigationBarItems(leading:  Button("left"){
//            print("left")
//        }, trailing: HStack{ Button("right"){
//            print("right")
//        }
//            Button("about"){
//                print("about")
//            }
//        })
//
//}

// MARK: udalit kadan tableview

//struct ContentView: View {
//
//    @State private var users = ["Ian", "maria", "ivana", "Ian", "maria","ivana"]
//    var body: some View {
//        NavigationView{
//            List {
//                ForEach(users, id: \.self) { user in
//                    Text(user)
//                } .onDelete(perform: delete)
//            }
//        }
//    }
//    func delete (at offsets: IndexSet) {
//        users.remove(atOffsets: offsets)
//    }
//
//}

// MARK: joyawa alish kadan tebleview

//struct ContentView: View {
//
//    @State private var users = ["Ian", "maria", "ivana", "Ian", "maria","ivana"]
//    var body: some View {
//        NavigationView{
//            List {
//                ForEach(users, id: \.self) { user in
//                    Text(user)
//                } .onMove(perform: move)
//            }
//            .navigationBarItems(trailing: EditButton())
//        }
//    }
//    func move( from source: IndexSet, to destination: Int){
//        users.move(fromOffsets: source, toOffset: destination)
//    }
//
//}
//
// MARK: tabView
//struct ContentView: View {
//
//    @State private var selected = 1
//
//    var body: some View {
//        TabView(selection: $selected) {
//            Text("First View")
//                .tabItem {
//                    Image(systemName: "1.circle")
//                    Text("First")
//                }.tag(1)
//            Text("Second View")
//                .tabItem {
//                    Image(systemName: "2.circle")
//                    Text("Second")
//                }.tag(2)
//        }
//    }
//}

// MARK: viewcha picker toggle button

//struct ContentView: View {
//
//    @State private var colors = ["red", "green", "blue"]
//    @State private var selectedColor = 1
//    @State private var addinationalSettings = false
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("colors")){
//                    Picker(selection: $selectedColor, label: Text("Select a color")) {
//
//                        ForEach(0..<colors.count) {
//                            Text(self.colors[$0])
//                        }
//                    }
//                }.pickerStyle(SegmentedPickerStyle())
//                Toggle(isOn: $addinationalSettings){ Text("addinational Settings")
//                }
//                Button(action: {
//                    //
//                }) {
//                    Text("save changes")
//                }.disabled(!addinationalSettings)
//            } .navigationBarTitle("settings")
//        }
//    }
//}
 
    // MARK: kalkulyatorcha

//struct ContentView: View {
//
//   @State private var checkAmount = ""
//    @State private var numberofpeople = 2
//    @State private var tippercentage = 0
//
//    let tippercentages = [ 0, 5, 10, 15, 20]
//
//    var totalPerPerson: Double {
//
//        let peopleCount = Double(numberofpeople + 2)
//        let tipSelection = Double(tippercentages[tippercentage])
//        let orderAmount = Double(checkAmount) ?? 0
//        let tipValue = orderAmount / 100 * tipSelection
//        let grandTotal = orderAmount + tipValue
//        let amountPerPerson = grandTotal / peopleCount
//
//        return amountPerPerson
//    }
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    TextField("Amount",  text: $checkAmount)
//                    Picker("number of people", selection: $numberofpeople){
//                        ForEach(2..<100) {
//                            Text("\($0) people")
//                        }
//                    }
//                }
//                Section(header:  Text("skolko chaevix vy xotite ostavit")) {
//                    Picker("tip percentage", selection: $tippercentage){
//                        ForEach(0..<tippercentages.count){
//                            Text("\(self.tippercentages [$0])%")
//                        }
//                    }.pickerStyle(SegmentedPickerStyle()  )
//
//                }
//                Section{
//                    Text("\(totalPerPerson, specifier: "%.2f")")
//
//                }
//            }
//            .navigationBarTitle("calculator", displayMode: .inline)
//        }
//
//    }
//}
//
//
//

// MARK: alert

//struct ContentView: View {
//
//    @State private var showingAlert = false
//
//    var body: some View {
//        Button("Show alert"){
//            self.showingAlert = true
//        } .alert(isPresented: $showingAlert) {
//            Alert(title: Text("Hello swiftui"),
//                  message: Text("some detail"),
//                  dismissButton: .default(Text("OK")))
//        }
//
//    }
//}
//Button(action: {
//    self.showingAlert = true
//}){
//    Text("Show Alert")
//}.alert(isPresented: $showingAlert){
//    Alert(title: Text("Are yo sure you want to delete this?"), message: Text("there is no way back"), primaryButton: .destructive(Text("delete")){
//        print("deleting...")
//    }, secondaryButton: .cancel())
//}
//Button(action: {
//    self.showingSheet = true
//}){
//    Text("Show action sheets")
//}.actionSheet(isPresented: $showingSheet){
//    ActionSheet(title: Text("What do you want to do?"),
//                message: Text("one choise"), buttons: [.default(Text("Dissmis action sheet")),
//                    .cancel(),
//                    .destructive(Text("delete"))
//                ])
//}
//

// MARK: rangawa alish kadan
//@State private var useGreenText = false
//Button("UIC Group"){
//    self.useGreenText.toggle()
//}.foregroundColor(useGreenText ? .blue : .green)

// MARK:


// MARK: flags appcha

//struct ContentView: View {
//
//    @State private var countries = ["UK", "USA", "Bangladesh", "Germany", "Argentina",
//                                    "Brazil", "Canada", "Greece", "Russia", "Sweden"].shuffled ()
//    @State private var correctAnswer = Int.random(in: 0...2)
//    @State private var score = 0
//    @State private var showingScore = false
//    @State private var scoreTitle = ""
//
//    var body: some View {
//        ZStack{
//            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all)
//            VStack(spacing: 40){
//                VStack {
//                    Text("Выбери флаг: ")
//                        .foregroundColor(.white)
//                        .font(.headline)
//
//                    Text(countries[correctAnswer])
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .fontWeight(.black)
//                }
//                ForEach(0..<3) { number in
//                    Button(action: {
//                        self.flagTapped(number)
//                        self.showingScore = true
//                    }){
//                        Image(self.countries[number])
//                            .renderingMode(.original)
//                            .frame(width: 250, height: 130)
//                            .clipShape(Capsule())
//                            .overlay(Capsule().stroke(Color.black, lineWidth: 0))
//                            .shadow(color: .black, radius: 2)
//                    }
//                }
//                Text("Общий счеть: \(score)")
//                    .font(.largeTitle)
//                    .foregroundColor(.green)
//                    .fontWeight(.black)
//                Spacer()
//            }
//        } .alert(isPresented: $showingScore) {
//            Alert(title: Text(scoreTitle), message: Text("Общий счеть: \(score)"), dismissButton: .default(Text("Продоложить")){
//                self.askQuestion()
//            })
//        }
//    }
//    func askQuestion() {
//        countries.shuffle()
//        correctAnswer = Int.random(in: 0...2)
//    }
//    func flagTapped(_ number: Int) {
//        if number == correctAnswer {
//            scoreTitle = "Правильный ответ!"
//            score += 1
//        } else {
//            scoreTitle = "Неправильно! Это флаг \(countries [number])"
//            score -= 1
//        }
//    }
//}
//
//
//
//
//
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView()
//        }
//    }
//

// MARK: svyazka mejdu klassami

//struct ContentView: View {
//    
//    @ObservedObject var settings = UserSettings()
//    
//    var body: some View {
//        VStack {
//            Text("your score is \(settings.score)")
//            Button(action: {
//                self.settings.score += 1
//            }){
//                Text("Increase Score")
//            }
//            
//            }
//        // @State - durni structoba
//        // @ObservedObject - durni classba 2-3 ta view kati svyazka kadanba
//        // @EnvironmentObject - svyazka mejdu vse view
//        
//        // @Published - vnutri classa
//        }
//    }

// MARK: perexod mejdu view

//struct DetailView: View {
//    var body: some View {
//        Text("This is detail View")
//    }
//}
//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink(destination: DetailView()){
//                    Text("show detail views")
//                }.navigationBarTitle(Text("navigation"))
//            }
//        }
//
//    }
//}

// MARK: animatsion view

//struct DetailView: View {
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        VStack{
//            Text("Detail")
//            Button("Back") {
//                self.presentationMode.wrappedValue.dismiss()
//            }
//
//        }
//
//    }
//}
//
//struct ContentView: View {
//    @State private var showingDetail = false
//
//    var body: some View {
//        Button(action: {
//            self.showingDetail.toggle()
//        }) {
//            Text("showDetail")
//        }.sheet(isPresented: $showingDetail){
//            DetailView()
//        }
//
//
//
//    }
//}

// MARK: Userdefaults
//
//struct ContentView: View {
//
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "tap")
//
//    var body: some View {
//        Button("Tap count \(tapCount)") {
//            self.tapCount += 1
//            UserDefaults.standard.set(tapCount, forKey: "tap")
//        }
//
//    }
//}
