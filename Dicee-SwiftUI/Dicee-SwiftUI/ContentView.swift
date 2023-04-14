//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by 潘鹤群 on 2023/4/4.
//

import SwiftUI

struct ContentView: View {
    
    @State var rightNumber = 1
    @State var leftNUmber = 1
    
    
    
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: rightNumber)
                    DiceView(n: leftNUmber)
                }
                .padding(.horizontal)
                Spacer()
                Button("ROLL") {
                    rightNumber = Int.random(in: 1...6)
                    leftNUmber = Int.random(in: 1...6)
                }
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .background(Color.red)
                Spacer()
                
            }
            
        }
    }
}


struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
