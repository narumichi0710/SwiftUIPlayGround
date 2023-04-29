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
                    Text("Update Control")
                }
                NavigationLink(destination: ModulerRootView()) {
                    Text("Moduler Structure")
                }
            }
            .navigationBarTitle("SwiftUI Play Ground")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
