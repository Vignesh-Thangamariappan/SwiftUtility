//
//  Extension+Encodable.swift
//  SwiftUtility
//
//  Created by Vignesh on 04/09/21.
//

import Foundation

public extension Encodable {
    
    /// Convert the Encodable object into a Dictionary
    var dictionary: [String: Any]? {
        
        guard let data = toJsonData else { return nil }
        
        return try? JSONSerialization.jsonObject(
            with: data,
            options: .allowFragments
        ) as? [String: Any]
    }
    
    
    /// Convert the Encodable object into PList Encoded Data
    var toPlistData: Data? {
        return try? PropertyListEncoder()
            .encode(self)
    }
    /// Convert the Encodable object into JSON encoded Data
    var toJsonData: Data? {
        return try? JSONEncoder()
            .encode(self)
    }
    
}

