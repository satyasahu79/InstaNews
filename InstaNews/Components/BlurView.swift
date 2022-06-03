//
//  BlurView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 28/05/22.
//

import SwiftUI

struct BlurView: View {
    
//    @State var appear : Bool = false
//    @State private var angle = 0.0
    
    var body: some View {
      
        
        ZStack {
           
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing : 0) {
                
                Circle()
                    .fill(Color("Blur4-c2"))
                //                    .fill(.pink)
                    .blur(radius: 100)
                    .frame(width: 264.1, height: 264.1)
                    .rotationEffect(.degrees(605))
                    .offset(x: -250,y:-70)
                    .zIndex(0)
                
                //Elipse
                Circle()
                    .fill(Color("Blur4-c1"))
                //                    .fill(.teal)
                    .blur(radius: 100)
                    .frame(width: 273.5, height: 273.5)
                    .rotationEffect(.degrees(105))
                    .offset(x:-100,y: -410)
                    .zIndex(5)
                
                Circle()
                    .fill(Color("Blur1-c1"))
                //                                            .fill(.black)
                    .blur(radius: 100)
                    .frame(width: 253.5, height: 253.5)
                    .rotationEffect(.degrees(105))
                    .offset(x:30,y: -630)
                    .zIndex(6)
                
                
                //Elipse
                Circle()
                    .fill(Color("Blur2-c2"))
                //                        .fill(.green)
                    .blur(radius: 100)
                    .frame(width: 255.5, height: 255.5)
                    .rotationEffect(.degrees(105))
                    .offset(x:80,y: -730)
                    .zIndex(5)
                
                Circle()
                    .fill(Color("Blur3-c2"))
                //                        .fill(.brown)
                    .blur(radius: 100)
                    .frame(width: 255.5, height: 255.5)
                    .rotationEffect(.degrees(105))
                    .offset(x:50,y: -880)
                    .zIndex(4)
                
                
                
                Circle()
                    .fill(Color("Blur3-c1"))
                //                                            .fill(.black)
                    .blur(radius: 120)
                    .frame(width: 351.5, height: 351.5)
                    .rotationEffect(.degrees(105))
                    .offset(x:-50,y: -1000)
                    .zIndex(3)
                
                
                Circle()
                    .fill(.red)
                //                    .fill(.green)
                    .blur(radius: 100)
                    .frame(width: 294.1, height: 294.1)
                    .rotationEffect(.degrees(605))
                    .offset(x: -180,y:-1300)
                    .zIndex(2)
                
                
                Circle()
                //                        .fill(.black)
                    .fill(Color("Blur1-c1"))
                    .blur(radius: 100)
                    .frame(width: 274.1, height: 274.1)
                    .rotationEffect(.degrees(605))
                    .offset(x: -100,y:-1750)
                //                        .zIndex(0)
                    .zIndex(1)
                
                Circle()
                //                        .fill(.black)
                    .fill(.orange)
                    .blur(radius: 180)
                    .frame(width: 253.1, height: 255.1)
                    .rotationEffect(.degrees(605))
                    .offset(x: -310,y:-1900)
                    .zIndex(0)
                
                Circle()
//                                        .fill(.black)
                    .fill(.yellow)
                    .blur(radius: 180)
                    .frame(width: 253.1, height: 255.1)
                    .rotationEffect(.degrees(605))
                    .offset(x: -370,y:-2250)
                    .zIndex(0)
                 
            }
//
            .frame(width: 470, height: 443)
            .offset(x:70, y: 800)
//            .rotationEffect(Angle.degrees(angle))
//            .scaleEffect(0.5)
//            .rotationEffect(.degrees(angle),anchor: UnitPoint(x: 0.35, y: -0.00))
            
//            .rotationEffect(.degrees(appear ? 360 : 00),anchor: UnitPoint(x: 0.4, y: -0.0))
            
        
//            .onAppear() {
//            withAnimation(.linear(duration: 30)) {
////                self.angle += 360
//            }
        }
        
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
            .preferredColorScheme(.dark)
    }
}
