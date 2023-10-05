//
//  ViewSettings.swift
//  TutorialSwiftUI
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 30/03/23.
//

import SwiftUI

struct ViewSettings: View {
    
    @State private var opacity = 1.0
    @State private var rotation = 0.0
    @State private var scale: CGFloat = 1
    @State private var showingWelcome = false
    @State private var angle: Double = 0
    @State private var borderThickness: CGFloat = 1
    @State private var rotationOne = 0.0
    
    var body: some View {
        VStack{
            
            Button (action: {
                self.angle += 45
            }) {
                Text ("Tap me")
                    .padding ()
                    .rotationEffect(.degrees (angle)) .animation(.interpolatingSpring(mass: 2, stiffness: 1, damping: 0.1, initialVelocity: 2))
                
            }
            Rectangle()
                .fill(Color.green)
                .frame(width: 200,height:200)
                .scaleEffect(scale)
                .onAppear{
                    let baseAnimation = Animation.easeOut(duration: 1)
                    let repeaded = baseAnimation
                        .repeatForever(autoreverses: true)
                    return withAnimation(repeaded) {
                        self.scale = 0.5
                    }
                    
                }
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 200,height:200)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.easeOut(duration: 3).delay(0.5))
                .onTapGesture {
                    self.rotation += 1080
                    
                }
            
            Button(action: {
                withAnimation(.linear(duration: 2)){
                    self.opacity -= 0.5
                }
            }) {
                Text("Tap me")
                    .padding()
                    .opacity(opacity)
            }
            
            Toggle(isOn: $showingWelcome.animation(.spring())){
                
                Text("toggle label")
                    .padding()
            }
            if showingWelcome {
                Text("hello swiftUI")
                
            }
            Button(action: {
                self.angle += 45
                self.borderThickness += 1
            }){
                Text("Tap me")
                    .padding()
                    .border (Color.red, width:
                                borderThickness)
                    .rotationEffect(.degrees (angle))
                    .animation(.easeIn)
            }
            
            .font(.largeTitle)
            .rotation3DEffect(.degrees(30), axis: (x: 0, y: 0, z: 1))
            .colorMultiply(.red)
            .saturation(0.5)
            .contrast(0.5)
            .opacity(0.5)
            
        }
    }
}
//        VStack{
//            Slider(value: $rotation, in: 0...1080, step: 1.0)
//            Text("SwiftUI")
//                .rotationEffect(.degrees(rotation), anchor: .bottomTrailing)
//        }
//
//        Button(action: {
//            print("Button Tapped")
//        }){
//            Image(systemName: "cloud.fill")
//            .frame(width:200, height: 200)
//                .foregroundColor(.white)
//            .padding()
//                .background(Color.green)
//            .clipShape(Circle())
//
//        }
//
//
//        rotationEffect(.radians (.pi/2))
//        Circle()
//            .stroke(Color.red, style: StrokeStyle(lineWidth: 5, dash: [20, 2]))
//            .frame(width:300, height: 300)


struct ViewSettings_Previews: PreviewProvider {
    static var previews: some View {
        ViewSettings()
    }
}
