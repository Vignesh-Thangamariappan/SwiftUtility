//
//  ConfigurableTests.swift
//  SwiftUtilityTests
//
//  Created by Vignesh on 04/09/21.
//

import XCTest
@testable import SwiftUtility

class ConfigurableTests: XCTestCase {
    
    func testConfigure() throws {
        
        let button = UIButton().configure {
            $0.backgroundColor = .blue
            $0.setTitle("Configured Button", for: .normal)
        }
        
        XCTAssertEqual(button.backgroundColor, .blue)
        XCTAssertEqual(button.title(for: .normal), "Configured Button")
    }
}
