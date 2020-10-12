//
//  ContentView.swift
//  GSeeGM
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 Nasi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var repo: String = ""
    @State var author: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Repository", text: $repo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Author or Email", text: $author)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.blue)
                .background(Color.blue)
            Button(action: {
                
            }, label: {
                Text("Get Commits")
            })
        }
        .padding([.top, .leading, .trailing], 70.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
