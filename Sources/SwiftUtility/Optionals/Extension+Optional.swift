//
//  Extension+Optional.swift
//  SwiftUtility
//
//  Created by Vignesh on 04/09/21.
//

import Foundation

extension Optional {
    
    /// Verify whether the object does not have any value without unwrapping
    var isNil: Bool { self == nil }
    
    /**
     *  Require this optional to contain a non-nil value
     *
     *  This method will either return the value that this optional contains, or trigger a `preconditionFailure` with an error message containing debug information.
     *
     *  - parameter hint: Optionally pass a hint that will get included in any error message generated in case nil was found.
     *
     *  - return: The value this optional contains.
     */
    func require(hint hintExpression: @autoclosure () -> String? = nil,
                 file: StaticString = #file,
                 line: UInt = #line) -> Wrapped {
        
        guard let unwrapped = self else {
            var message = "Required value was nil in \(file), at line \(line)"
            
            if let hint = hintExpression() {
                message.append(". Debugging hint: \(hint)")
            }
            
            preconditionFailure(message)
        }
        
        return unwrapped
    }
}


