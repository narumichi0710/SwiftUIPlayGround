//
//  UpdateControlRootView.swift
//

import SwiftUI

protocol UpdateTrigger: ObservableObject {
    var trigger: Date { get set }
    func update(file: String, func: String, line: Int)
}

class UpdateControlableObject: UpdateTrigger {
    @Published var trigger: Date = .init()
    /// Published属性を持つプロパティを更新し、Viewを再描画
    func update(
        file: String = #fileID,
        func: String = #function,
        line: Int = #line
    ) {
        objectWillChange.send()
        trigger = .now
        debugPrint("\(trigger) \(file).\(`func`) #\(line)")
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

struct UpdateControlRootView: View {
    @StateObject var sampleDataA = SampleDataA()
    @StateObject var sampleDataB = SampleDataB()

    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("\(sampleDataA.count)")
                Text("\(sampleDataB.count)")
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

struct UpdateControlRootView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateControlRootView()
    }
}
