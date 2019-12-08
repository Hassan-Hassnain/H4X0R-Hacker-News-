//
//  DetailView.swift
//  H4X0R
//
//  Created by Usama Sadiq on 11/23/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.
//
import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
