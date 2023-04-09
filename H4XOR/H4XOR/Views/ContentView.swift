//
//  ContentView.swift
//  H4XOR
//
//  Created by 潘鹤群 on 2023/4/6.
//

import SwiftUI

struct ContentView: View {
    
    
   @ObservedObject var networkManager = NetworkManger()
    
    var body: some View {
        NavigationView{
            List(posts){ post in
                
                
                
                
                Text(post.title)
            }
            .navigationBarTitle("H4XOR NEWS")
            
            
        }
      
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






//let posts = [
//
//    Post(id:"1",title:"你好"),
//
//    Post(id:"2",title:"HI"),
//
//    Post(id:"3",title:"Bonjour")
//
//]













