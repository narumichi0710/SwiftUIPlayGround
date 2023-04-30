//
//  ModulerViewModel.swift
//  SwiftUIPlayGround
//
//  Created by Narumichi Kubo on 2023/04/29.
//

import Foundation

class ModulerRootData: UpdateControlableObject {
    let featureA: ParentFeatureA
    let featureB: ParentFeatureB
    
    init(
        featureA: ParentFeatureA = .init(),
        featureB: ParentFeatureB = .init()
    ) {
        self.featureA = featureA
        self.featureB = featureB
    }
    
    func increment(type: UpdateType = .all) {
        switch type {
        case .all:
            featureA.increment()
            featureB.incrementModel()
        case .featureA:
            featureA.increment()
        case .featureB:
            featureB.incrementModel()
        }
    }

    func update(type: UpdateType = .all) {
        switch type {
        case .all:
            super.update()
        case .featureA:
            featureA.update()
        case .featureB:
            featureB.update()
        }
    }

    enum UpdateType {
        case all
        case featureA
        case featureB
    }
}

class ParentFeatureA: UpdateControlableObject {
    private(set) var count: Int = 0
    let child: FeatureAChild = .init()

    func increment() {
        count += 1
    }
}

class FeatureAChild: UpdateControlableObject {
    private(set) var count: Int = 0

    func increment() {
        count += 1
    }
}

class ParentFeatureB: UpdateControlableObject {
    private(set) var model: Model = .init()
    
    func incrementModel() {
        model.count += 1
    }

    struct Model {
        var count: Int = 0
    }
}
