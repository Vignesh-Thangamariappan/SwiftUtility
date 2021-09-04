//
//  Configurable.swift
//  SwiftUtility
//
//  Created by Vignesh on 04/09/21.
//

import Foundation

public protocol Configurable {}

extension Configurable {

    /// Allows to set properties with closures.
    ///
    ///     let label = UILabel().configure {
    ///         $0.textAlignment = .center
    ///         $0.textColor = UIColor.white()
    ///         $0.text = "This is configured!"
    ///     }
    public func configure(block: (inout (Self)) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }

}

extension NSObject: Configurable {}
