//
//  UpdateControlRootView.swift
//

import SwiftUI

struct UpdateControlRootView: View {
    @StateObject var sampleDataA = SampleDataA()
    @StateObject var sampleDataB = SampleDataB()

    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    Text("\(sampleDataA.count) count")
                    Text("\(sampleDataA.num) times update")
                    Text("by incrementByTrigger")
                }
                VStack {
                    Text("\(sampleDataB.count) count")
                    Text("\(sampleDataB.num) times update")
                    Text("by incrementByWillChange")
                }
            }
            Spacer()
            HStack {
                VStack {
                    Button("Increment A") {
                        sampleDataA.increment()
                    }
                    Button("Update by Trigger") {
                        sampleDataA.updateByTrigger()
                    }
                }
                VStack {
                    Button("Increment B") {
                        sampleDataB.increment()
                    }
                    Button("Update by WillChange") {
                        sampleDataB.updateByWillChange()
                    }
                }
            }
            
            Button("Reset") {
                sampleDataA.reset()
                sampleDataB.reset()
            }

            Spacer()
        }
    }
}

class SampleDataA: UpdateControlableObject {
    private(set) var count = 0
    private(set) var num = 0

    func increment() {
        count += 1
    }

    // publishedで更新
    func updateByTrigger() {
        num += 1
        update()
    }
    
    func reset() {
        count = 0
        num = 0
        update()
    }
}

class SampleDataB: ObservableObject {
    private(set) var count = 0
    private(set) var num = 0
    
    func increment() {
        count += 1
    }
    
    // objectWillChangeで更新
    func updateByWillChange() {
        num += 1
        objectWillChange.send()
    }
    
    func reset() {
        count = 0
        num = 0
        objectWillChange.send()
    }
}


struct UpdateControlRootView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateControlRootView()
    }
}
