//
//  Extension+Decodable.swift
//  SwiftUtility

//
//  Created by Vignesh on 04/09/21.
//

import Foundation

public extension Decodable {
    
    /// Decode the object from Json Data
    static func decode(fromJsonData data: Data) -> Self? {
        return try? JSONDecoder()
                .decode(self.self, from: data)
    }
    
    /// Decode the object from Plist Data
    static func decode(fromPlistData data: Data) -> Self? {
        return try? PropertyListDecoder()
            .decode(self.self, from: data)
    }
    
    /// Decode the object from JSON String
    static func decode(from jsonString: String) -> Self? {
        guard let jsonData = jsonString.data(using: .utf8) else {
            return nil
        }
        return decode(fromJsonData: jsonData)
    }
}
