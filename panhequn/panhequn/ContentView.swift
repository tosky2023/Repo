//
//  ContentView.swift
//  panhequn
//
//  Created by 潘鹤群 on 2023/4/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(red: 0.91, green: 0.30, blue: 0.24, opacity: 1.00)
                .ignoresSafeArea(.all)
            VStack {
                
                Image("pan")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white,lineWidth: 5)
                    )
                
                
                Text("ICE MOUNT")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("IOS developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                
                Divider()
                
                InfoView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InfoView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 40)
            .overlay(HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.green)
                
                Text("123456777")
            })
            .padding(.all)
    }
}
