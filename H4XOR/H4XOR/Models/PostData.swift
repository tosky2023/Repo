//
//  PostData.swift
//  H4XOR
//
//  Created by 潘鹤群 on 2023/4/7.
//

import Foundation

struct Results: Decodable {
    let hits : [Post]
}

struct Post: Decodable,Identifiable  {
    var id:String{
        return objcetID
    }
    
    let objcetID:String
    let points: Int
    let title: String
    let url: String?
}
