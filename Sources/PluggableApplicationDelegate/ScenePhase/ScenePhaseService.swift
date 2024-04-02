//
//  File.swift
//
//
//  Created by Long Vu on 2/4/24.
//

import Foundation

public protocol ScenePhaseService {
    func becomeActive()
    func resignActive()
    func enterBackground()

    func performTaskBeforeAppAppear() async
}

public extension ScenePhaseService {
    func becomeActive() {}
    func resignActive() {}
    func enterBackground() {}

    func performTaskBeforeAppAppear() async {}
}
