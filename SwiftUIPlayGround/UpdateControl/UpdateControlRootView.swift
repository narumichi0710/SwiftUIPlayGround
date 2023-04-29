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
                    Text("\(sampleDataA.count) times update")
                    Text("by incrementByTrigger")
                }
                VStack {
                    Text("\(sampleDataB.count)")
                    Text("by incrementByWillChange")
                }
            }
            Spacer()
            HStack {
                Button("IncrementByWillChange") {
                    sampleDataA.incrementByTrigger()
                }
                Button("IncrementByTrigger") {
                    sampleDataB.incrementByWillChange()
                }
            }
            Spacer()
        }
    }
}

class SampleDataA: UpdateControlableObject {
    private(set) var count = 0

    // publishedで更新
    func incrementByTrigger() {
        count += 1
        update()
    }
}

class SampleDataB: ObservableObject {
    private(set) var count = 0

    // objectWillChangeで更新
    func incrementByWillChange() {
        count += 1
        objectWillChange.send()
    }
}


struct UpdateControlRootView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateControlRootView()
    }
}
