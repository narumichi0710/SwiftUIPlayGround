//
//  ContentView.swift
//  swiftUIDesignPatterns
//
//  Created by Narumichi Kubo on 2023/04/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: UpdateControlRootView()) {
                    Text("UI Update Control")
                }
            }
            .navigationBarTitle("SwiftUI Design Patterns")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
