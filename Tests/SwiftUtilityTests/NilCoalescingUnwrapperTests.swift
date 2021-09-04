//
//  NilCoalescingUnwrapperTests.swift
//  SwiftUtilityTests
//
//  Created by Vignesh on 04/09/21.
//

import XCTest
@testable import SwiftUtility

class NilCoalescingUnwrapperTests: XCTestCase {
    
    var userName: String?
    
    func testUnwrappedValue() throws {
        
        userName = "Steve"
        XCTAssertNoThrow(try userName ?! NSError(domain: "Missing Value", code: 0, userInfo: nil))
    }
    
    func testError() throws {
        
        userName = nil
        XCTAssertThrowsError(try userName ?! NSError(domain: "Missing Value", code: 0, userInfo: nil))
    }
}
