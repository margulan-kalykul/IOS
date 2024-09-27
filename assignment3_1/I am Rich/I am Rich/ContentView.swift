//
//  ContentView.swift
//  I am Rich
//
//  Created by user252323 on 9/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("diamond").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200)
            Text("I am Rich")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
