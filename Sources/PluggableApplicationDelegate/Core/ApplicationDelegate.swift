//
//  ApplicationDelegate.swift
//
//
//  Created by Long Vu on 06/01/2023.
//

#if os(iOS)
    import UIKit
    public typealias ApplicationDelegate = UIApplicationDelegate
#endif

#if os(macOS)
    import AppKit
    public typealias ApplicationDelegate = NSApplicationDelegate
#endif

public protocol ApplicationService: ApplicationDelegate {}
