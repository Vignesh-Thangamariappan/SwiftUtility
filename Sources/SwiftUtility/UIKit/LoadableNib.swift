//
//  LoadableNib.swift
//  SwiftUtility
//
//  Created by Vignesh on 04/09/21.
//

import UIKit

protocol LoadableNib: AnyObject {
    static var nib: UINib { get }
}

extension LoadableNib {
    static var nib: UINib {
        return UINib(nibName: name, bundle: Bundle.init(for: self))
    }
    
    static var name: String {
        return String(describing: self)
    }
}

extension LoadableNib where Self: UIView {
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError()
        }
        
        return view
    }
}
