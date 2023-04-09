//
//  DetailView.swift
//  H4XOR
//
//  Created by 潘鹤群 on 2023/4/8.
//

import SwiftUI


struct DetailView: View {
    
    let url : String?
    
    var body: some View {
        WebView(urlSting:url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.baidu.com")
    }
}

