//
//  ModulerRootData.swift
//  SwiftUIPlayGround
//
//  Created by Narumichi Kubo on 2023/04/29.
//

import SwiftUI

struct ModulerRootView: View {
    @StateObject var data = ModulerRootData()

    var body: some View {
            VStack {
                Text("Root View")
                    .font(.title)
                VStack {
                    Text("FeatureA Count: \(data.featureA.count)")
                    Text("FeatureA Child Count: \(data.featureA.child.count)")
                }
                FeatureAView(featureA: data.featureA) {
                    data.update()
                }
                Button(action: {
                    data.increment(type: .featureA)
                }, label: {
                    Text("Increment To FeatureA")
                })
                Button(action: {
                    data.featureA.child.increment()
                }, label: {
                    Text("Increment To FeatureA Child")
                })
                Button(action: {
                    data.update()
                }, label: {
                    Text("Update All")
                })
            }
            .padding()
            .border(Color.green, width: 2)
        }
}

struct FeatureAView: View {
    @ObservedObject var featureA: ParentFeatureA
    var update: () -> Void
    
    var body: some View {
        
        VStack {
            Text("FeatureA View")
                .font(.title)
            Text("Count: \(featureA.count)")
            Text("Child Count: \(featureA.child.count)")
            
            Button("Increment FeatureA") {
                featureA.increment()
            }
            Button("Update from FeatureA View") {
                featureA.update()
            }
            Button("Update from Root View") {
                update()
            }
            FeatureAChildView(
                featureAChild: featureA.child,
                updateFeature: { featureA.update() },
                updateRoot: update
            )
        }
        .padding()
        .border(Color.blue, width: 2)
        .padding(.bottom, 16.0)
    }
}

struct FeatureAChildView: View {
    @ObservedObject var featureAChild: FeatureAChild
    var updateFeature: () -> Void
    var updateRoot: () -> Void
    
    var body: some View {
        VStack {
            Text("Child View")
                .font(.title)
            Text("Count: \(featureAChild.count)")
            Button("Increment Child") {
                featureAChild.increment()
            }
            Button("Update from Child View") {
                featureAChild.update()
            }
            Button("Update from FeatureA View") {
                updateFeature()
            }
            Button("Update from Root View") {
                updateRoot()
            }
        }
        .padding()
        .border(Color.purple, width: 2)
    }
}
