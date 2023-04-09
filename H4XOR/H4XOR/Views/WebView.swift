//
//  WebView.swift
//  H4XOR
//
//  Created by 潘鹤群 on 2023/4/9.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlSting:String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
       return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlSting {
            if let url = URL(string: safeString) {
                let request = URLRequest(url:url)
                uiView.load(request)
            }
        }
    }
}
    
