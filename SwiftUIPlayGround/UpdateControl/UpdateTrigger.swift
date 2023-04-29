//
//  UpdateTrigger.swift
//  SwiftUIPlayGround
//
//  Created by Narumichi Kubo on 2023/04/29.
//

import Foundation

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
        trigger = .now
        debugPrint("\(trigger) \(file).\(`func`) #\(line)")
    }
}
