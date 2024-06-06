//
//  MovieSwiftUITests.swift
//  MovieSwiftUITests
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import XCTest
import ViewInspector

@testable import MovieSwiftUI

final class MovieSwiftUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testExample() throws {
        let name = getName()
        XCTAssertNotNil(getName())
        
    }
    
    func testAsync(){
        let expectation = expectation(description: "")
    }
    
  

}

extension MovieSwiftUITests {
    func getName() -> String {
        return "Hasan"
    }
}
