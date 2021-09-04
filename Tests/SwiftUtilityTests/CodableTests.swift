//
//  CodableTests.swift
//  SwiftUtilityTests
//
//  Created by Vignesh on 04/09/21.
//

import XCTest
@testable import SwiftUtility

class CodableTests: XCTestCase {
    
    let user = User(name: "Stuart", age: 12)
    
    func testDecodeFromJSONData() throws {
        let jsonData = try XCTUnwrap(User.jsonData)
        XCTAssertNotNil(
            User.decode(fromJsonData: jsonData)
        )
    }
    
    func testDecodeFromJsonString() throws {
        
        XCTAssertNotNil(
            User.decode(from: User.jsonString)
        )
    }
    
    func testEncodeToJSONData() throws {
        
        let generatedData = try XCTUnwrap(user.toJsonData)
        XCTAssertEqual(generatedData, User.jsonData)
    }
    
    func testEncodeAndDecodePlistData() throws {
        
        let generatedPlistData = try XCTUnwrap(user.toPlistData)
        
        let generatedUser = try XCTUnwrap(User.decode(fromPlistData: generatedPlistData))
        XCTAssertEqual(user, generatedUser)
    }
    
    func testDecodeToDictionary() throws {
        
        let generatedDictionary = try XCTUnwrap(user.dictionary)
        XCTAssertEqual(generatedDictionary["name"] as? String, user.name)
    }
}


struct User: Codable, Equatable {
    var name: String
    var age: Int
}

extension User {
    
    static var jsonString: String {
        """
{
"name":"Stuart",
"age":12
}
"""
    }
    
    static var jsonObject: [String: Any] {
        ["name": "Stuart",
         "age": 12]
    }
    
    static var jsonData: Data? {
        try? JSONSerialization.data(withJSONObject: jsonObject, options: [])
    }
}

